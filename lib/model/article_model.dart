import 'dart:convert';
import 'package:http/http.dart' as http;

class Article {
  final String? id;
  final String name;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  Article({
    this.id,
    required this.name,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']['id'],
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': {
        'id': id,
        'name': name,
      },
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(),
      'content': content,
    };
  }
}

List<Article> parseArticles(String responseBody) {
  final parsed = json.decode(responseBody)['articles'].cast<Map<String, dynamic>>();

  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

Future<List<Article>> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=tesla&from=2024-04-24&sortBy=publishedAt&apiKey=3f55f849dd494fe9b677e63af9a8bc99'));

  if (response.statusCode == 200) {
    return parseArticles(response.body);
  } else {
    throw Exception('Failed to load articles');
  }
}
