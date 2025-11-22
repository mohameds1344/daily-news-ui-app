import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_news/controls/web_view.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/models/models_card.dart';
import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class carousel extends StatefulWidget {
  final List<ArticleModel> CarousleList;

  carousel({super.key, required this.CarousleList});

  @override
  State<carousel> createState() => _carouselState();
}

class _carouselState extends State<carousel> {
  int activeIndex = 0;

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
            itemCount: min(5, widget.CarousleList.length),
            itemBuilder: (context, index, realIndex) {
              String image =
                  widget.CarousleList[index].iamge ??
                  "https://cdn.pixabay.com/photo/2024/07/20/17/12/warning-8908707_1280.png";
              String name = widget.CarousleList[index].tittel;
              String urlName = widget.CarousleList[index].urlName;
              return builImage(context, image, index, name,urlName);
            },
            options: CarouselOptions(
              viewportFraction: .88,
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reson) {
                setState(() {
                  activeIndex = index;
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

  Widget builImage(
    BuildContext context,
    String image,
    int index,
    String name,
    String urlName,
  ) => GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ArticleWebView(URL: urlName);
          },
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.network(
                "https://cdn.pixabay.com/photo/2024/07/20/17/12/warning-8908707_1280.png",
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 250,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 120),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.4, 0.6, 0.8, 1.0],
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,

    count: min(5, widget.CarousleList.length),
    effect: ExpandingDotsEffect(dotHeight: 10, dotWidth: 10,
    activeDotColor: Colors.blueAccent),
  );
}
