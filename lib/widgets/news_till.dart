import 'package:daily_news/controls/web_view.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTill extends StatelessWidget {
  const NewsTill({super.key, required this.articleModels});
  final ArticleModel articleModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ArticleWebView(URL: articleModels.urlName);
              },
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        articleModels.iamge ??
                        "https://cdn.pixabay.com/photo/2024/07/20/17/12/warning-8908707_1280.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 200,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => Image.network(
                          "https://cdn.pixabay.com/photo/2024/07/20/17/12/warning-8908707_1280.png",
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
              ),
      
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    articleModels.tittel,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: "Poppins",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(right: 12,bottom: 12,left: 12),
                child: Text(
                  articleModels.subTittel ?? '',
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
