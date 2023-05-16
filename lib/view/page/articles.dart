import 'package:articles/bloc/article_bloc.dart';
import 'package:articles/view/widget/article_card.dart';
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
          return const CircularProgressIndicator(
            color: Colors.cyanAccent,
          );
        } else if (state is ArticleLoadedState) {
          return ListView.builder(
              controller: _scrollController,
              itemCount: state.getArticles.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleCard(article: state.getArticles[index]);
              });
        } else if (state is ArticleErrorState) {
          return Center(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
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
    // if (_scrollController.offset >=
    //         _scrollController.position.maxScrollExtent &&
    //     !_scrollController.position.outOfRange) {

    // }
    print("Hola!");
    ArticleBloc().add(LoadArticle());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
