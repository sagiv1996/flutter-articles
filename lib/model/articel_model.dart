
import 'package:json_annotation/json_annotation.dart';

part 'articel_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String? title;
  final String? description;
  final String? content;
  final String? urlToImage;
  ArticleModel(
      {required this.title,
      required this.description,
      this.content,
      this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> data) =>
      _$ArticleModelFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
