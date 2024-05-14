import 'package:flutter/material.dart';
import 'package:news_app/data/data.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/slider_model.dart';
import 'package:news_app/pages/breaking_news.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/pages/trending_news.dart';
import 'package:news_app/widgets/breaking_news_slider.dart';
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/trending_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  late Future<List<Article>> futureArticles;
  late Future<List<SliderModel>> sliderList;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    futureArticles = fetchArticles();
    sliderList = fetchSliderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: const Row(
            children: [
              Text("World", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text("News", style: TextStyle(color: Color.fromARGB(255, 234, 0, 0), fontWeight: FontWeight.bold))
            ],
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryNews(name: categories[index].name)
                        ),
                      );
                    },
                    child: CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].name,
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Text(
                    "Breaking News!",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(width: 150),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const BreakingNews(),
                        ),
                      );
                    },
                    child: const Text("View All", style: TextStyle(color: Colors.red, decoration: TextDecoration.underline, decorationColor: Colors.red, decorationThickness: 3)),
                  )
                ],
              ),
            ),
            BreakingNewsSliderWidget(
              breakingArticles: sliderList.then((articles) => articles.take(5).toList()),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Text(
                    "Trending News!",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(width: 150),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const TrendingNews(),
                        ),
                      );
                    },
                    child: const Text("View All", style: TextStyle(color: Colors.red, decoration: TextDecoration.underline, decorationColor: Colors.red, decorationThickness: 3)),
                  )
                ],
              ),
            ),
            TrendingNewsWidget(trendingArticles: futureArticles.then((articles) => articles.take(5).toList()))
          ],
        ),
      ),
    );
  }
}
