import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigatorProvider {
  static Future<T?> pushNamed<T>(String path, {dynamic arguments}) {
    return Modular.to.pushNamed(path, arguments: arguments);
  }

  static void pop() {
    return Modular.to.pop();
  }

  static void popUntil(String route) {
    return Modular.to.popUntil(ModalRoute.withName(route));
  }

  static Future<T?> popAndPushNamed<T>(String path, {dynamic arguments}) {
    return Modular.to.popAndPushNamed(path, arguments: arguments);
  }
}
