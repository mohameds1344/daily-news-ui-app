import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/widgets/carousle_buid_image.dart';
import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsCarousel extends StatefulWidget {
  final List<ArticleModel> articlesCarousel;

  const NewsCarousel({super.key, required this.articlesCarousel});

  @override
  State<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  int PageIndext = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
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
                            slivers: [
                              NewsListViewBuilder(
                                category: "sports",
                                lang: "en",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          child: CarouselSlider.builder(
            itemCount: min(5, widget.articlesCarousel.length),
            itemBuilder: (context, index, realIndex) {
              String image =
                  widget.articlesCarousel[index].iamge ??
                  "https://cdn.pixabay.com/photo/2024/07/20/17/12/warning-8908707_1280.png";
              String tittleName = widget.articlesCarousel[index].tittel;
              String urlName = widget.articlesCarousel[index].urlName;
              return CarouselBuildImage(
                image: image,
                pageNamber: index,
                text: tittleName,
                urlName: urlName,
              );
            },
            options: CarouselOptions(
              viewportFraction: .88,
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reson) {
                setState(() {
                  PageIndext = index;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10),

        Center(child: SizedBox(width: 100, child: buildIndicator())),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: PageIndext,

    count: min(5, widget.articlesCarousel.length),
    effect: ExpandingDotsEffect(
      dotHeight: 10,
      dotWidth: 10,
      activeDotColor: Colors.blueAccent,
    ),
  );
}
