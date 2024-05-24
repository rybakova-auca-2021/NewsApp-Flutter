import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class CategoryModel {
  const CategoryModel({
    required this.name,
    required this.image,
  });

  
  final String name;
  final String image;
}

Future<List<Article>> fetchArticlesByCategory(String category) async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=3f55f849dd494fe9b677e63af9a8bc99'));

  if (response.statusCode == 200) {
    return parseArticles(response.body);
  } else {
    throw Exception('Failed to load articles');
  }
}
