import 'package:devlearn/core/interface/ilearn_service.dart';
import 'package:devlearn/core/service/learn_service.dart';
import 'package:devlearn/features/core/core_module.dart';
import 'package:devlearn/features/home/home_controller.dart';
import 'package:devlearn/features/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports {
    return [
      CoreModule(),
    ];
  }

  @override
  void binds(i) {
    i.add(HomeController.new);
    i.add<ILearnService>(LearnService.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
