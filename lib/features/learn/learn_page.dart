import 'package:devlearn/component/default_body_component.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/component/tags_component.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:devlearn/features/learn/component/contributors_component.dart';
import 'package:devlearn/features/learn/component/reference_component.dart';
import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  final LearnModel learnModel;
  const LearnPage({
    required this.learnModel,
    super.key,
  });

  void onClickExecution() {
    NavigatorProvider.pushNamed('/execution/', arguments: learnModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: onClickExecution,
                child: Text('INICIAR ESTUDO'),
              ),
            ],
          ),
        ),
      ),
      body: DefaultBodyComponent(
        children: [
          Text(
            learnModel.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TagsComponent(tags: learnModel.tags),
          Divider(),
          Text(
            'Descrição',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            learnModel.description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${learnModel.content.length.toString().padLeft(2, '0')} perguntas',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          ContributorsComponent(contributors: learnModel.contributors),
          Text(
            'Materiais de apoio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'São materiais de referência que podem ser consultados para aprimorar o conhecimento sobre o assunto',
          ),
          Text(
            'São materiais externos que não estão em nosso controle, portanto cuidado!',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          ReferenceComponent(references: learnModel.references),
        ],
      ),
    );
  }
}
