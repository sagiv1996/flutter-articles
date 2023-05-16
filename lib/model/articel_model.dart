import 'package:json_annotation/json_annotation.dart';

part 'articel_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String title;
  final String? description;
  final String? author;
  final String? url;

  ArticleModel({
    required this.title,
    this.description,
    this.author,
    this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> data) =>
      _$ArticleModelFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
