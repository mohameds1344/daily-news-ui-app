import 'package:dio/dio.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/services/news_services.dart';
import 'package:daily_news/widgets/news_till.dart';
import 'package:flutter/material.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          
          child: NewsTill(articleModels: articles[index]),
        );
        
      }),
      
    );
  }
}



// ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 10,
//       itemBuilder: (context, num) {
//         return const NewsTill();
//       },
//     );




