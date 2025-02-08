import 'dart:convert';
import 'package:devlearn/core/model/learn_content_options_model.dart';

class LearnContentModel {
  String id;
  String question;
  int answer;
  String answerDescription;
  List<LearnContentOptionsModel> options;
  LearnContentModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.answerDescription,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
      'answerDescription': answerDescription,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory LearnContentModel.fromMap(Map<String, dynamic> map) {
    return LearnContentModel(
      id: map['id'] as String,
      question: map['question'] as String,
      answer: map['answer'] as int,
      answerDescription: map['answerDescription'] as String,
      options: List<LearnContentOptionsModel>.from(
        (map['options'] as List<dynamic>).map<LearnContentOptionsModel>(
          (x) => LearnContentOptionsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnContentModel.fromJson(String source) =>
      LearnContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
