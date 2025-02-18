import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

extension ContextExtension on BuildContext {
  T watchContext<T extends Object>([SelectCallback<T>? onSelect]) {
    return watch(onSelect);
  }

  T readContext<T extends Object>() {
    return read<T>();
  }
}
