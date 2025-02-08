import 'package:devlearn/component/level_component.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:devlearn/component/tags_component.dart';
import 'package:flutter/material.dart';

class LearnComponent extends StatelessWidget {
  final LearnModel learnModel;
  const LearnComponent({
    required this.learnModel,
    super.key,
  });

  void onClickLearn() {
    NavigatorProvider.pushNamed('/learn/', arguments: learnModel);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onClickLearn,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                learnModel.title,
                style: TextStyle(fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                learnModel.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              TagsComponent(tags: learnModel.tags),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelComponent(level: learnModel.level),
                  const Icon(
                    Icons.arrow_forward_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
