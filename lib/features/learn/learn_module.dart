import 'package:devlearn/features/learn/learn_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LearnModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => LearnPage(learnModel: r.args.data),
    );
  }
}
