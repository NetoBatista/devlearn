import 'package:devlearn/core/model/learn_content_model.dart';
import 'package:devlearn/features/execution/execution_controller.dart';
import 'package:flutter/material.dart';

class ExecutionAnswerComponent extends StatelessWidget {
  final LearnContentModel content;
  final ExecutionController controller;
  final Animation<double> fadeAnswerAnimation;
  const ExecutionAnswerComponent({
    required this.content,
    required this.controller,
    required this.fadeAnswerAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!controller.showAnswer) {
      return SizedBox();
    }
    return FadeTransition(
      opacity: fadeAnswerAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Resposta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (controller.currentAnswer == content.answer)
            Row(
              spacing: 8,
              children: [
                Icon(Icons.check_outlined, color: Colors.green),
                Text('A resposta está correta'),
              ],
            ),
          if (controller.currentAnswer != content.answer)
            Row(
              spacing: 8,
              children: [
                Icon(Icons.close, color: Colors.red),
                Text('A resposta está incorreta'),
              ],
            ),
          Text(
            content.answerDescription,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
