import 'package:flutter/material.dart';
import 'package:articles/model/articel_model.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                if (article.description != null)
                  Text(
                    article.description!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                SizedBox(height: 8),
                if (article.content != null)
                  Text(
                    article.content!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Read More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
