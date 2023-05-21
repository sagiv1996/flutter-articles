// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseArticles _$ResponseArticlesFromJson(Map<String, dynamic> json) =>
    ResponseArticles(
      json['status'] as String?,
      json['totalResults'] as int,
      (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseArticlesToJson(ResponseArticles instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

ResponseArticlesWidthDrift _$ResponseArticlesWidthDriftFromJson(
        Map<String, dynamic> json) =>
    ResponseArticlesWidthDrift(
      json['articles'] as Future<List<ArticleTableData>>,
    );

Map<String, dynamic> _$ResponseArticlesWidthDriftToJson(
        ResponseArticlesWidthDrift instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
