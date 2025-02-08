import 'package:flutter/material.dart';

class ExecutionOptionsComponent extends StatelessWidget {
  final bool isSelected;
  final void Function()? onPressed;
  final String title;
  const ExecutionOptionsComponent({
    required this.isSelected,
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var color = isSelected ? Colors.deepPurple : Colors.grey;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 2),
        ),
        child: Text(title),
      ),
    );
  }
}
