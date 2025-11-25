import 'package:daily_news/models/models_card.dart';
import 'package:daily_news/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  List<ModelCard> CategoryList = [
    ModelCard(
      iamg: "assets/business.avif",
      categoryName: "Business",
      newsName: "business",
      langauge: 'en',
    ),
    ModelCard(
      iamg: "assets/entertaiment.avif",
      categoryName: "Entertaiment",
      newsName: "entertaiment",
      langauge: 'en',
    ),
    ModelCard(
      iamg: "assets/sports.avif",
      categoryName: "Sports",
      newsName: 'sports',
      langauge: 'ar',
    ),
    ModelCard(
      iamg: "assets/general.avif",
      categoryName: "General",
      newsName: "world",
      langauge: 'en',
    ),
    ModelCard(
      iamg: "assets/health.avif",
      categoryName: "Health",
      newsName: "health",
      langauge: 'en',
    ),
    ModelCard(
      iamg: "assets/science.avif",
      categoryName: "Science",
      newsName: "science",
      langauge: 'en',
    ),
    ModelCard(
      iamg: "assets/technology.avif",
      categoryName: "Technology",
      newsName: "technology",
      langauge: 'en',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(modelsCard: CategoryList[index]);
        },
      ),
    );
  }
}
