import 'package:devlearn/features/execution/execution_controller.dart';
import 'package:devlearn/features/execution/execution_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExecutionModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ExecutionController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => ExecutionPage(learnModel: r.args.data),
    );
  }
}
