import 'package:articles/model/response_articles.dart';
import 'package:articles/service/rest_client.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../model/articel_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  String appKey = dotenv.env['appKey']!;
  static const int resultsPerRequest = 10;
  static bool isAllArticles = false;
  final client = RestClient(Dio());

  static List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);

  ArticleBloc() : super(ArticleInitial()) {
    on<LoadArticles>((event, emit) async {
      try {
        if (articles.isEmpty) emit(ArticleLoadingState());
        if (isAllArticles) return;
        ResponseArticles result =
            await client.getArticles(appKey, pageSize, resultsPerRequest);

        articles.addAll(result.articles);
        updateIsAllArticles(result.totalResults);
        emit(ArticleLoadedState(articles: articles));
      } catch (error) {
        emit(ArticleErrorState(
            'We cant load data. pleas, try again later', error.toString()));
      }
    });

    on<RefreshArticlesEvent>((event, emit) async {
      try {
        articles.clear();
        ResponseArticles result =
            await client.getArticles(appKey, pageSize, resultsPerRequest);
        articles = result.articles;
        updateIsAllArticles(result.totalResults);
        emit(ArticleLoadedState(articles: articles));
      } catch (error) {
        emit(ArticleErrorState(
            'We cant load data. pleas, try again later', error.toString()));
      }
    });
  }

  void updateIsAllArticles(int totalResult) {
    isAllArticles = articles.length >= totalResult;
  }

  int get pageSize {
    int totalArticles = ArticleBloc.articles.length;
    int pageCount = (totalArticles / ArticleBloc.resultsPerRequest).ceil();

    return pageCount + 1;
  }
}
