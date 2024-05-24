import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String? image;
  final String? categoryName;

  const CategoryTile({super.key, required this.image, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
      child: Stack(
        children: [
          ClipRRect( 
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(image!, width: 120, height: 60, fit: BoxFit.cover),
          ),
          Positioned(
            top: 55,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
