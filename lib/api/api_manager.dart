import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/api/model/news/news_response.dart';
import 'package:news_app/api/model/source/source_response.dart';

class ApiManager {
  /*https://newsapi.org/v2/top-headlines/sources?apiKey=
  864cbf8e0e4e451da80a4f3b02de5cf9
  */
   Future<SourceResponse> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(
          ApiConstants.baseUrl,
          EndPoints.sourceApi,
          {
            'apiKey': ApiConstants.apiKey,
            'category':categoryId
          }
      );
      var response = await http.get(url);
      var responseBody = response.body;

      ///body=>String
      ///String =>json
      var json = jsonDecode(responseBody);

      ///json=>object
      return SourceResponse.fromJson(json);
      // SourceResponse.fromJson(jsonDecode(response.body))
    }
    catch (e) {
      rethrow;
    }
  }

/*https://newsapi.org/v2/everything?q=bitcoin&apiKey=
864cbf8e0e4e451da80a4f3b02de5cf9*/
   Future<NewsResponse> getNewsBySourceId(String sourceId,) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
          {
            'apiKey': ApiConstants.apiKey ,
            'sources': sourceId,
          }
      );
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  // static Future<NewsResponse> getNewsBySearch(String query, int page) async {
  //   try {
  //     Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.newsApi, {
  //       'apiKey': ApiConstants.apiKey,
  //       'q': query,
  //       'pageSize': '10',
  //       'page': page.toString(),
  //     });
  //     var response = await http.get(url);
  //     var responseBody = response.body;
  //     var json = jsonDecode(responseBody);
  //     return NewsResponse.fromJson(json);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}