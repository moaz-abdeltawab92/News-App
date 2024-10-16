import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsSevices {
  final Dio dio;
  NewsSevices(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=bb8da8fe8b6e4d1c9b46a894f36cb0f2&category=$category');
      Map<String, dynamic> jsondata = response.data;

      List<dynamic> articles = jsondata['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        if (article['url'] != "https://removed.com") {
          ArticleModel articleModel =
              ArticleModel.fromJson(article); // بناء الـ object

          articlesList.add(articleModel);
        }
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
