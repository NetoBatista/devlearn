import 'dart:convert';

class GithubModel {
  String name;
  String downloadUrl;
  GithubModel({
    required this.name,
    required this.downloadUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'download_url': downloadUrl,
    };
  }

  factory GithubModel.fromMap(Map<String, dynamic> map) {
    return GithubModel(
      name: map['name'] as String,
      downloadUrl: map['download_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubModel.fromJson(String source) {
    return GithubModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  static List<GithubModel> fromJsonList(String source) {
    var data = json.decode(source) as List<dynamic>;
    return data.map((e) => GithubModel.fromMap(e)).toList();
  }
}
