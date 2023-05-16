import 'package:articles/model/response_articles.dart';
import 'package:articles/service/rest_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../model/articel_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  String appKey = dotenv.env['appKey']!;
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  ArticleBloc() : super(ArticleInitial()) {
    on<LoadArticle>((event, emit) async {
      try {
        emit(ArticleLoadingState());
        await Future<void>.delayed(const Duration(seconds: 1));
        const int resultsPerRequest = 5;
        int pageSize = ArticleLoadedState.articles.length ~/ resultsPerRequest;
        ResponseArticles result =
            await client.getArticles(appKey, pageSize, resultsPerRequest);
        emit(ArticleLoadedState(result.articles));
      } catch (error) {
        emit(const ArticleErrorState(
            'We cant load data. pleas, try again later'));
      }
    });
  }
}
