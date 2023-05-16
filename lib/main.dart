import 'package:articles/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:articles/view/page/articles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ArticleBloc()..add(LoadArticle()),
        child: const MaterialApp(home: Article()),
      );
}
