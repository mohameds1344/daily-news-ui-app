
import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/services/news_services.dart';
import 'package:daily_news/widgets/carousel_till.dart';
import 'package:daily_news/widgets/common_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CarouselBuilderView extends StatefulWidget {
  const CarouselBuilderView({
    super.key,
    required this.category,
    required this.lang,
  });

  final String category;
  final String lang;

  @override
  State<CarouselBuilderView> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<CarouselBuilderView> {
  var futur;

  @override
  void initState() {
    super.initState();
    futur = NewsServices(
      Dio(),
    ).getTopHeadlineNews(category: widget.category, lang: widget.lang);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      // list<ArticleModel> path for futur becu thire dynamic
      future: futur,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text(""),
          ); // this
        } else if (snapshot.hasData) {
          return carousel(CarousleList: snapshot.data!);
        } else if (snapshot.hasError) {
          return const ErrorMessage();
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text("No Data!")),
          );
        }
      },
    );
  }
}
