// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
    };
