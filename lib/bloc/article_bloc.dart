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
          title:
              'Elon Musk reportedly tells Tesla staff he must approve all hiring',
          description:
              'Tesla Chief Executive Elon Musk has said that the company can make no new hires unless he personally approves them, including contractors, the Information reported on Monday, citing an email to staff. According to the report, Musk told executives to send him …',
          author: 'author',
          url: 'url');
      bb.add(aa);
      emit(ArticleLoadedState(bb));
    });
  }
}
