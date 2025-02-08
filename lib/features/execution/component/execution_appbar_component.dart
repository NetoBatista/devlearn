import 'package:devlearn/features/execution/execution_controller.dart';
import 'package:flutter/material.dart';

class ExecutionAppbarComponent extends StatefulWidget {
  final ExecutionController controller;
  const ExecutionAppbarComponent({
    required this.controller,
    super.key,
  });

  @override
  State<ExecutionAppbarComponent> createState() =>
      _ExecutionAppbarComponentState();
}

class _ExecutionAppbarComponentState extends State<ExecutionAppbarComponent> {
  final double _lastValue = 0;

  @override
  Widget build(BuildContext context) {
    var contents = widget.controller.learnModel.content;
    var currentQuestion = widget.controller.currentQuestion + 1;
    var perc = currentQuestion / contents.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.controller.learnModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: TweenAnimationBuilder(
                tween: Tween(begin: _lastValue, end: perc),
                duration: Duration(seconds: 1),
                builder: (BuildContext _, double value, Widget? __) {
                  return LinearProgressIndicator(
                    value: value,
                  );
                },
              ),
            ),
            Text(
              '$currentQuestion / ${contents.length}',
            )
          ],
        ),
      ],
    );
  }
}
