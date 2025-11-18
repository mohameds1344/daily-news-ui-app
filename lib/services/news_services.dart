import 'package:daily_news/api_key.dart';
import 'package:dio/dio.dart';
import 'package:daily_news/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getTopHeadlineNews({required String category,required String lang}) async {
    try {
      List<ArticleModel> articleList = [];
      String? nextPage;

      for (int i = 0; i < 3; i++) {
        String url =
            'https://newsdata.io/api/1/latest?apikey=${ApiConfig.apiKey}&language=$lang&category=$category&size=10';


        if (nextPage != null) {
          url += '&page=$nextPage';
        }

        Response response = await dio.get(url);
        Map<String, dynamic> data = response.data;

        List<dynamic> results = data["results"] ?? [];
        for (var article in results) {
          articleList.add(
            ArticleModel(
              iamge: article['image_url'],
              tittel: article['title'],
              subTittel: article['description'],
              urlName: article['link']
            ),
          );
        }


        nextPage = data['nextPage'];

    
        if (nextPage == null) {
          break;
        }
      }

      return articleList;
    } catch (e) {
      return [];
    }
  }
}









// import 'package:dio/dio.dart';
// import 'package:first_project/models/article_model.dart';

// class NewsServices {
//   final Dio dio;

//   NewsServices(this.dio);

//   Future<List<ArticleModel>> getTopHeadlineNews() async {
//     try {
//       String nextPage;
//       Response response = await dio.get(
//         'https://newsdata.io/api/1/latest?apikey=pub_152a1707ee7c406e975932335d8b35d9&language=ar&category=top',
//       );
//       Map<String, dynamic> jsonData = response.data;

//       List<dynamic> articles = jsonData["results"];
//       List<ArticleModel> articleList = [];

//       for (var article in articles) {
//         ArticleModel articleModels = ArticleModel(
//           iamge: article['image_url'],
//           tittel: article['title'],
//           subTittel: article['description'],
//         );
//         articleList.add(articleModels);
//       }
//       return articleList;
//     } catch (e) {
//       return [];
//     }
//   }
// }
