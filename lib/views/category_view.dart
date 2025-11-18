import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:daily_news/widgets/news_list_view.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category,required this.lang});

  final String category;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [NewsListViewBuilder(
          category: category,
          lang: lang,)],
      ),
    );
  }
}
