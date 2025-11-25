import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  EmptyView({super.key, required this.Category, required this.Lang});
  String Category;
  String Lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [NewsListViewBuilder(category: Category, lang: Lang)],
      ),
    );
  }
}
