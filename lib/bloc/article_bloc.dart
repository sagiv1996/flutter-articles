import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/articel_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<LoadArticle>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      List<ArticleModel> bb = List<ArticleModel>.empty(growable: true);
      ArticleModel aa = ArticleModel(
          title: 'title',
          description: 'description',
          author: 'author',
          url: 'url');
      bb.add(aa);
      emit(ArticleLoadedState(bb));
    });
  }
}
