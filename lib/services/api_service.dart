import 'dart:convert';

import 'package:http/http.dart';

import '../model/article_model.dart';

class ApiService {
  Future<List<Article>> getArticle(String cat) async {
    String category = cat;
    Response res = await get(Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=26d83a8f0295411e964ef0f2d12926b5&pageSize=100"));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
