import 'dart:convert';

class ContributorModel {
  String name;
  String url;
  String? imageUrl;
  ContributorModel({
    required this.name,
    required this.url,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'imageUrl': imageUrl,
    };
  }

  factory ContributorModel.fromMap(Map<String, dynamic> map) {
    return ContributorModel(
      name: map['name'] as String,
      url: map['url'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContributorModel.fromJson(String source) =>
      ContributorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
