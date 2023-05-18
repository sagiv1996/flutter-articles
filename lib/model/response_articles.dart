import 'package:json_annotation/json_annotation.dart';
import 'articel_model.dart';

part 'response_articles.g.dart';

@JsonSerializable()
class ResponseArticles {
  String? status;
  int totalResults;
  List<ArticleModel> articles;
  ResponseArticles(this.status, this.totalResults, this.articles);

  factory ResponseArticles.fromJson(Map<String, dynamic> data) =>
      _$ResponseArticlesFromJson(data);

  Map<String, dynamic> toJson() => _$ResponseArticlesToJson(this);
}
