import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:devlearn/core/state/state_shared.dart';
import 'package:flutter/material.dart';

class ExecutionController extends ValueNotifier<IStateSharedState> {
  ExecutionController() : super(StateSharedState(isLoading: false));

  late LearnModel learnModel;
  int currentQuestion = 0;
  int currentAnswer = -1;
  bool showAnswer = false;
  List<int> answers = [];

  void init(LearnModel learn) {
    learnModel = learn;
  }

  void onClickNextQuestion() {
    if (currentQuestion == learnModel.content.length - 1) {
      NavigatorProvider.pushNamed(
        '/result',
        arguments: {
          'learnModel': learnModel,
          'answers': answers,
        },
      );
      return;
    }
    currentAnswer = -1;
    showAnswer = false;
    currentQuestion++;
    notifyListeners();
  }

  void onClickAnswer(int id) {
    currentAnswer = id;
    answers.add(currentAnswer);
    notifyListeners();
  }

  void onClickShowAnswer(bool value) {
    showAnswer = value;
    notifyListeners();
  }
}
