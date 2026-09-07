//todo:new remote ds=>interface
import 'package:news_app/api/model/news/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse>getNewsBySourceId(String sourceId);
}