class Article {
  final String title;
  final String description;
  final String author;
  final String url;

  Article({
    required this.title,
    required this.description,
    required this.author,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
