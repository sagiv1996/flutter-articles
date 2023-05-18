part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class LoadArticles extends ArticleEvent {}

class ClearArticlesEvent extends ArticleEvent {}

class RefreshArticlesEvent extends ArticleEvent {}
