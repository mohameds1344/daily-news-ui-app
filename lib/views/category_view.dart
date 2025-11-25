import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.category,
    required this.lang,
    required this.cagAppBarName,
  });

  final String category;
  final String lang;
  final String cagAppBarName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          cagAppBarName,
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade100,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [NewsListViewBuilder(category: category, lang: lang)],
      ),
    );
  }
}
