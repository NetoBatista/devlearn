import 'dart:convert';

import 'package:devlearn/core/model/contributor_model.dart';
import 'package:devlearn/core/model/learn_content_model.dart';
import 'package:devlearn/core/model/learn_reference_model.dart';

class LearnModel {
  String id;
  String title;
  String description;
  String category;
  int level;
  List<String> tags;
  List<ContributorModel> contributors;
  List<LearnContentModel> content;
  List<LearnReferenceModel> references;
  LearnModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    required this.tags,
    required this.contributors,
    required this.content,
    required this.references,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'level': level,
      'tags': tags,
      'contributors': contributors.map((x) => x.toMap()).toList(),
      'content': content.map((x) => x.toMap()).toList(),
      'references': references.map((x) => x.toMap()).toList(),
    };
  }

  factory LearnModel.fromMap(Map<String, dynamic> map) {
    return LearnModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      level: map['level'] as int,
      tags: List<String>.from((map['tags'] as List<dynamic>)),
      contributors: List<ContributorModel>.from(
        (map['contributors'] as List<dynamic>).map<ContributorModel>(
          (x) => ContributorModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      content: List<LearnContentModel>.from(
        (map['content'] as List<dynamic>).map<LearnContentModel>(
          (x) => LearnContentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      references: List<LearnReferenceModel>.from(
        (map['references'] as List<dynamic>).map<LearnReferenceModel>(
          (x) => LearnReferenceModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnModel.fromJson(String source) {
    return LearnModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
