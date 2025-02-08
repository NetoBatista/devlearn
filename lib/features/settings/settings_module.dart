import 'package:devlearn/core/interface/ilearn_service.dart';
import 'package:devlearn/core/service/learn_service.dart';
import 'package:devlearn/features/home/home_controller.dart';
import 'package:devlearn/features/settings/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends Module {
  @override
  void binds(i) {
    i.add(HomeController.new);
    i.add<ILearnService>(LearnService.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SettingsPage(),
    );
  }
}
