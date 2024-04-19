import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_flutter/model/model_news.dart';

//get data API
class NetworkService {
  static Future<List<ModelNews>> fetchNews(String kategori) async {
    String baseUrl = 'https://api-berita-indonesia.vercel.app/okezone/$kategori';
    try {
      final response = await http.get(Uri.parse(baseUrl));
      List listData = (jsonDecode(response.body) as Map<String, dynamic>)['data']['posts'];
      var dataNews = ModelNews.fromJsonList(listData);
      return dataNews;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}