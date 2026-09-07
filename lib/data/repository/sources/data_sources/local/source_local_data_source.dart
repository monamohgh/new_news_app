//todo:source local ds=>interface
import 'package:news_app/api/model/source/source_response.dart';

abstract class SourceLocalDataSource {
  Future<SourceResponse>getSources(String categoryId);
///method fro save data (Caching it)
void saveSources(SourceResponse sourceResponse);
}