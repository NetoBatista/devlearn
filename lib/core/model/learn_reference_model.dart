import 'dart:convert';

class LearnReferenceModel {
  String title;
  String url;
  LearnReferenceModel({
    required this.title,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
    };
  }

  factory LearnReferenceModel.fromMap(Map<String, dynamic> map) {
    return LearnReferenceModel(
      title: map['title'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnReferenceModel.fromJson(String source) =>
      LearnReferenceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
