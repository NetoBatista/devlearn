import 'package:devlearn/main_module.dart';
import 'package:devlearn/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  return runApp(
    ModularApp(
      module: MainModule(),
      child: const MainWidget(),
    ),
  );
}
