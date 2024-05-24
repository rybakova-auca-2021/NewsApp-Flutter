import 'package:flutter/material.dart';
import 'package:news_app/model/slider_model.dart';

class SliderItemImage extends StatelessWidget {
  const SliderItemImage({
    super.key,
    required this.sliderItem,
  });

  final SliderModel sliderItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.network(
              sliderItem.urlToImage ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/placeholder.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  sliderItem.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
