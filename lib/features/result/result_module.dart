import 'package:devlearn/features/result/result_controller.dart';
import 'package:devlearn/features/result/result_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResultModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ResultController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => ResultPage(
        learnModel: r.args.data['learnModel'],
        answers: r.args.data['answers'],
      ),
    );
  }
}
