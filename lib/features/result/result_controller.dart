import 'package:devlearn/core/state/state_shared.dart';
import 'package:flutter/material.dart';

class ResultController extends ValueNotifier<IStateSharedState> {
  ResultController() : super(StateSharedState(isLoading: false));
}
