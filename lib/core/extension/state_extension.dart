import 'package:flutter/material.dart';

extension StateExtension on State {
  Future<void> onInitializedAsync(Future<void> Function() callback) async {
    WidgetsBinding.instance.addPostFrameCallback((_) => callback());
  }
}
