//todo:news repository=>interface
import 'package:news_app/api/model/news/news_response.dart';

abstract class NewsRepository {
  Future<NewsResponse>getNewsBySourceId(String sourceId);
}