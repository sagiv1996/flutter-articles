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
      await Future<void>.delayed(const Duration(seconds: 1));
      ResponseArticles result = await client.getArticles();
      print(result);
      emit(ArticleLoadedState(result.articles));
    });
  }
}
