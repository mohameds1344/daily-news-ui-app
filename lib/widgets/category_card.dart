import 'dart:ui';

import 'package:daily_news/models/models_card.dart';
import 'package:daily_news/views/category_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.modelsCard});

  final ModelCard modelsCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: modelsCard.newsName,
                lang: modelsCard.langauge,
                nameApp: modelsCard.categoryName,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(modelsCard.iamg),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              modelsCard.categoryName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.99),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


