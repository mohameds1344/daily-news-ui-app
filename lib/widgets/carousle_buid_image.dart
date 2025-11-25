import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/controls/web_view.dart';
import 'package:flutter/material.dart';

class CarouselBuildImage extends StatelessWidget {
  const CarouselBuildImage({
    super.key,
    required this.image,
    required this.pageNamber,
    required this.text,
    required this.urlName,
  });

  final String image;
  final int pageNamber;
  final String text;
  final String urlName;

  @override
  Widget build(BuildContext context) => GestureDetector(
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
                  text,
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
}
