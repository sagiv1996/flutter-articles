import 'package:articles/bloc/article_bloc.dart';
import 'package:articles/view/widget/article_card.dart';
import 'package:articles/view/widget/error_card.dart';
import 'package:articles/view/widget/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitial || state is ArticleLoadingState) {
          return const LoadingCard();
        } else if (state is ArticleLoadedState) {
          return RefreshIndicator(
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: state.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.articles.length - 1 &&
                        !ArticleBloc.isAllArticles) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                      );
                    }
                    return ArticleCard(article: state.articles[index]);
                  }),
              onRefresh: () async {
                BlocProvider.of<ArticleBloc>(context)
                    .add(RefreshArticlesEvent());
              });
        } else if (state is ArticleErrorState) {
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: state.articles.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 && !ArticleBloc.isAllArticles) {
                  return ErrorCard(
                    errorTitle: state.errorTitle,
                    errorMessage: state.errorMessage,
                  );
                }
                return ArticleCard(article: state.articles[index]);
              });
        }
        return const Text('End of page');
      }));

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      BlocProvider.of<ArticleBloc>(context).add(LoadArticles());
    }
    ;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
