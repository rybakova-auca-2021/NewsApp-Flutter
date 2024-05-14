import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/model/slider_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/widgets/slider_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BreakingNewsSliderWidget extends StatefulWidget {
  final Future<List<SliderModel>> breakingArticles;

  const BreakingNewsSliderWidget({
    super.key,
    required this.breakingArticles,
  });

  @override
  _BreakingNewsSliderWidgetState createState() => _BreakingNewsSliderWidgetState();
}

class _BreakingNewsSliderWidgetState extends State<BreakingNewsSliderWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SliderModel>>(
      future: widget.breakingArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load slider data'));
        } else if (snapshot.hasData) {
          final sliders = snapshot.data!;
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIdx) {
                  final sliderItem = sliders[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleView(articleUrl: sliderItem.url),
                        ),
                      );
                    },
                    child: SliderItemImage(sliderItem: sliderItem),
                  );
                },
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: sliders.length,
                effect: const WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.red,
                  dotColor: Colors.grey,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
