class ArticleModel {
  final String title;
  final String description;
  final String author;
  final String url;

  ArticleModel({
    required this.title,
    required this.description,
    required this.author,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
