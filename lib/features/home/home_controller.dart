import 'package:devlearn/core/interface/ilearn_service.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/state/state_shared.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<IStateSharedState> {
  final ILearnService _learnService;
  HomeController(
    this._learnService,
  ) : super(StateSharedState());
  final List<LearnModel> learns = [];
  final List<String> groups = [];

  Future<void> init() async {
    value.stateIsLoading();
    notifyListeners();

    var response = await _learnService.get();
    value.error = response.failure() ?? '';
    learns.addAll(response.success() ?? []);

    List<String> categories = [];
    for (var item in learns) {
      var category = item.category.toLowerCase();
      category = category[0].toUpperCase() + category.substring(1);
      categories.add(category);
    }

    groups.addAll(Set.from(categories));

    value.isLoading = false;
    notifyListeners();
  }
}
