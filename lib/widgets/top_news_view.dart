import 'package:daily_news/widgets/carousel_builder_view.dart';
import 'package:daily_news/widgets/categories_list_view.dart';
import 'package:daily_news/widgets/news_list_view_builder.dart';
import 'package:flutter/material.dart';

class topListView extends StatelessWidget {
  const topListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CateoriesListView()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: CarouselBuilderView(category: "sports", lang: "en"),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  "Highlight",
                  style: TextStyle(fontSize: 23, 
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500),
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
                                  category: "top",
                                  lang: "ar",
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
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        const NewsListViewBuilder(category: 'top', lang: 'ar'),
      ],
    );
  }
}
