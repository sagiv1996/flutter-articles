import 'package:flutter/material.dart';
import 'package:articles/model/articel_model.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) => Card(child: Text(article.title));
}
