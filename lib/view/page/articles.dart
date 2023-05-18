import 'package:articles/bloc/article_bloc.dart';
import 'package:articles/view/widget/article_card.dart';
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
                            valueColor: AlwaysStoppedAnimation<Color>(Colors
                                .blue), // Set the color of the progress indicator
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
          return Center(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 64.0,
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Error',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            state.errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  )));
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
