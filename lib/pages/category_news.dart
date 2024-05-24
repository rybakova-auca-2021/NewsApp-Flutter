import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/trending_news.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key, required this.name});

  final String name;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticlesByCategory(widget.name.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: TrendingNewsWidget(trendingArticles: futureArticles)),
    );
  }
}
