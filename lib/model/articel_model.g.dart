// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String,
      description: json['description'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'url': instance.url,
    };
