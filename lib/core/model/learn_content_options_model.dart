import 'dart:convert';

class LearnContentOptionsModel {
  int id;
  String text;
  LearnContentOptionsModel({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory LearnContentOptionsModel.fromMap(Map<String, dynamic> map) {
    return LearnContentOptionsModel(
      id: map['id'] as int,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnContentOptionsModel.fromJson(String source) =>
      LearnContentOptionsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
