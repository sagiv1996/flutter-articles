import 'package:articles/model/response_articles.dart';
import 'package:articles/service/rest_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../model/articel_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  ArticleBloc() : super(ArticleInitial()) {
    on<LoadArticle>((event, emit) async {
      emit(ArticleLoadingState());
      await Future<void>.delayed(const Duration(seconds: 1));
      const int resultsPerRequest = 5;
      int pageSize = ArticleLoadedState.articles.length ~/ resultsPerRequest;
      ResponseArticles result = await client.getArticles(
          "505e647bbabd48d1ba723b85b0f685c6", pageSize, resultsPerRequest);
      emit(ArticleLoadedState(result.articles));
    });
  }
}
