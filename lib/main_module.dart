import 'package:devlearn/features/core/core_module.dart';
import 'package:devlearn/features/execution/execution_module.dart';
import 'package:devlearn/features/home/home_module.dart';
import 'package:devlearn/features/learn/learn_module.dart';
import 'package:devlearn/features/result/result_module.dart';
import 'package:devlearn/features/settings/settings_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  List<Module> get imports {
    return [
      CoreModule(),
    ];
  }

  @override
  void routes(r) {
    r.module(
      '/',
      module: HomeModule(),
    );
    r.module(
      '/learn',
      module: LearnModule(),
    );
    r.module(
      '/execution',
      module: ExecutionModule(),
    );
    r.module(
      '/result',
      module: ResultModule(),
    );
    r.module(
      '/settings',
      module: SettingsModule(),
    );
  }
}
