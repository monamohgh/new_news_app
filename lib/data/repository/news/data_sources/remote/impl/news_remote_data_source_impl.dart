//todo:news remote ds =>impl
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news/news_response.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
//todo:http
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) async{
  var newsResponse=await apiManager.getNewsBySourceId(sourceId);
  return newsResponse;
  }
  }

  //todo:dio
class NewsRemoteDataSourceDioImpl implements NewsRemoteDataSource{
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    // TODO: implement getNewsBySourceId
    throw UnimplementedError();
  }
  
}

//todo:retrofit
class NewsRemoteDataSourceRetrofitImpl implements NewsRemoteDataSource{
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    // TODO: implement getNewsBySourceId
    throw UnimplementedError();
  }

}
