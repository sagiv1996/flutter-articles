part of 'article_bloc.dart';

@immutable
abstract class ArticleState {
  const ArticleState();

  List<String> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  static List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);

  ArticleLoadedState(articles) {
    ArticleLoadedState.articles.addAll(articles);
  }
  List<ArticleModel> get getArticles {
    return ArticleLoadedState.articles;
  }

  static List<ArticleModel> addItem(List<ArticleModel> articles) {
    // const List<ArticleModel> a =  articlesa.addAll(articles);
    ArticleLoadedState.articles.addAll(articles);
    return ArticleLoadedState.articles;
  }
}

class ArticleErrorState extends ArticleState {
  final String errorMessage;

  const ArticleErrorState(this.errorMessage);
}
