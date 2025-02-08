abstract class IStateSharedState {
  bool isLoading = false;
  String error = '';
  String info = '';

  void stateIsLoading();
}

class StateSharedState extends IStateSharedState {
  StateSharedState({bool isLoading = true}) {
    this.isLoading = isLoading;
  }
  @override
  void stateIsLoading() {
    isLoading = true;
    error = '';
    info = '';
  }
}
