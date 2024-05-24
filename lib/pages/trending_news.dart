import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widgets/trending_news.dart';

class TrendingNews extends StatefulWidget {
  const TrendingNews({super.key});

  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          margin: const EdgeInsets.only(left: 65),
          child: const Text(
            "Trending News",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(child: TrendingNewsWidget(trendingArticles: futureArticles)),
    );
  }
}
