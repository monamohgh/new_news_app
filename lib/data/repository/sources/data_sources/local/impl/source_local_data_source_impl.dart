//todo:source local ds=>impl
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  void saveSources(SourceResponse sourceResponse) {
    // TODO: implement saveSources
  }
}