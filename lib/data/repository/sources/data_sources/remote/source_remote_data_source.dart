//todo:source remote ds=>interface
import 'package:news_app/api/model/source/source_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse> getSources(String categoryId);///=>same method in repository
}
