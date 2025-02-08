import 'package:devlearn/component/default_body_component.dart';
import 'package:devlearn/core/extension/context_extension.dart';
import 'package:devlearn/core/extension/state_extension.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/provider/dependency_provider.dart';
import 'package:devlearn/features/execution/component/execution_answer_component.dart';
import 'package:devlearn/features/execution/component/execution_appbar_component.dart';
import 'package:devlearn/features/execution/component/execution_options_component.dart';
import 'package:devlearn/features/execution/execution_controller.dart';
import 'package:flutter/material.dart';

class ExecutionPage extends StatefulWidget {
  final LearnModel learnModel;
  const ExecutionPage({
    required this.learnModel,
    super.key,
  });

  @override
  State<ExecutionPage> createState() => _ExecutionPageState();
}

class _ExecutionPageState extends State<ExecutionPage>
    with TickerProviderStateMixin {
  ExecutionController _controller = DependencyProvider.get();
  late AnimationController _animationQuestionController;
  late AnimationController _animationAnswerController;
  late AnimationController _animationButtonAnswerController;
  late Animation<double> _fadeQuestionAnimation;
  late Animation<double> _fadeAnswerAnimation;
  late Animation<double> _fadeButtonAnswerAnimation;

  @override
  void initState() {
    _controller.init(widget.learnModel);
    super.initState();

    _animationQuestionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animationAnswerController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animationButtonAnswerController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _fadeQuestionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationQuestionController,
    );

    _fadeAnswerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationAnswerController,
    );

    _fadeButtonAnswerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationButtonAnswerController,
    );

    _animationQuestionController.forward();

    onInitializedAsync(() async {
      _controller = context.watchContext();
    });
  }

  @override
  void dispose() {
    _animationQuestionController.dispose();
    super.dispose();
  }

  void onClickAnswer(int id) {
    if (_controller.currentAnswer < 0) {
      _animationButtonAnswerController.reset();
      _animationButtonAnswerController.forward();
    }
    _controller.onClickAnswer(id);
  }

  void onClickShowAnswer() {
    _animationAnswerController.reset();
    _animationAnswerController.forward();
    _controller.onClickShowAnswer(true);
  }

  void onClickNextQuestion() {
    _animationQuestionController.reset();
    _animationQuestionController.forward();
    _animationAnswerController.reset();
    _animationButtonAnswerController.reset();

    _controller.onClickNextQuestion();
  }

  bool lastQuestion() {
    return _controller.learnModel.content.length ==
        (_controller.currentQuestion + 1);
  }

  @override
  Widget build(BuildContext context) {
    var contents = _controller.learnModel.content;
    var content = contents.elementAt(
      _controller.currentQuestion,
    );

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).textTheme.labelMedium,
        title: ExecutionAppbarComponent(
          controller: _controller,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !_controller.showAnswer,
                    child: FadeTransition(
                      opacity: _fadeButtonAnswerAnimation,
                      child: FilledButton(
                        onPressed: onClickShowAnswer,
                        child: Text('VER RESPOSTA'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _controller.showAnswer && !lastQuestion(),
                    child: FilledButton(
                      onPressed: onClickNextQuestion,
                      child: Text('PRÓXIMA PERGUNTA'),
                    ),
                  ),
                  Visibility(
                    visible: _controller.showAnswer && lastQuestion(),
                    child: FilledButton(
                      onPressed: onClickNextQuestion,
                      child: Text('VER RESUMO'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeQuestionAnimation,
        child: DefaultBodyComponent(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              content.question,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: content.options.length,
              separatorBuilder: (BuildContext _, int index) {
                return SizedBox(height: 16);
              },
              itemBuilder: (BuildContext _, int index) {
                var option = content.options.elementAt(index);
                var isSelected = _controller.currentAnswer == option.id;
                return ExecutionOptionsComponent(
                  isSelected: isSelected,
                  onPressed: _controller.showAnswer
                      ? null
                      : () => onClickAnswer(option.id),
                  title: option.text,
                );
              },
            ),
            ExecutionAnswerComponent(
              content: content,
              controller: _controller,
              fadeAnswerAnimation: _fadeAnswerAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
