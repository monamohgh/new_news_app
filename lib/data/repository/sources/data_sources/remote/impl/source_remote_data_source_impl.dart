//todo:source remote ds =>impl
import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
@Injectable(as:SourceRemoteDataSource)///=>create object from the sub class(SourceRemoteDataSourceImpl) because it is abstract
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse> getSources(String categoryId) {
   return apiManager.getSources(categoryId);
  }
  
}