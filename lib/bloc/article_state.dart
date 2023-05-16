part of 'article_bloc.dart';

@immutable
abstract class ArticleState {
  const ArticleState();

  List<String> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  final List<Article> articles;

  const ArticleLoadedState(this.articles);
}

class ArticleErrorState extends ArticleState {
  final String errorMessage;

  const ArticleErrorState(this.errorMessage);
}
