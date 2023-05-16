import 'package:articles/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitial) {
          return const CircularProgressIndicator(
            color: Colors.cyanAccent,
          );
        }
        if (state is ArticleLoadedState) {
          return Text('${state.articles.length} :) ');
        }

        return const Text('End of page');
      }));
}
