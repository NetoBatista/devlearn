import 'package:devlearn/component/default_body_component.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final LearnModel learnModel;
  final List<int> answers;
  const ResultPage({
    required this.learnModel,
    required this.answers,
    super.key,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  LearnModel get learnModel => widget.learnModel;
  List<int> get answers => widget.answers;
  int correctAnswers() {
    int result = 0;
    for (var index = 0; index < learnModel.content.length; index++) {
      var content = learnModel.content.elementAt(index);
      var answer = answers.elementAt(index);

      if (content.answer == answer) {
        result++;
      }
    }
    return result;
  }

  void onClickClose() => NavigatorProvider.popUntil('/learn/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: onClickClose,
                child: Text('FINALIZAR ESTUDO'),
              ),
            ],
          ),
        ),
      ),
      body: DefaultBodyComponent(
        children: [
          Text(
            'Você concluiu o seu estudo! 📚',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Você respondeu ${correctAnswers()} de ${answers.length} corretamente!',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Card(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: learnModel.content.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                var content = learnModel.content.elementAt(index);
                var selectedIdAnswer = answers.elementAt(index);
                var answer = content.options.firstWhere(
                  (x) => x.id == selectedIdAnswer,
                );
                var isCorrect = content.answer == selectedIdAnswer;
                return ListTile(
                  title: Text(
                    content.question,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(answer.text),
                  trailing: Icon(
                    isCorrect ? Icons.check_outlined : Icons.close,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
