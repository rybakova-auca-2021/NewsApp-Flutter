import 'package:flutter/material.dart';
import 'package:news_app/model/slider_model.dart';
import 'package:news_app/widgets/breaking_news.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  late Future<List<SliderModel>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchSliderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          margin: const EdgeInsets.only(left: 65),
          child: const Text(
            "Breaking News",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(child: BreakingNewsWidget(breakingArticles: futureArticles)),
    );
  }
}
