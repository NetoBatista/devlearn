import 'package:devlearn/core/constant/level_constant.dart';
import 'package:flutter/material.dart';

class LevelComponent extends StatelessWidget {
  final int level;
  const LevelComponent({required this.level, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: level == 2 ? Colors.green : Colors.grey,
          ),
        ),
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: level == 3 ? Colors.green : Colors.grey,
          ),
        ),
        Text(
          LevelConstant.getText(level),
          style: TextStyle(letterSpacing: 1),
        ),
      ],
    );
  }
}
