//todo:news repository=> impl=>concrete class
import 'package:injectable/injectable.dart';
import 'package:news_app/api/model/news/news_response.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';

///implements from the same(NewsRepositoryImpl  implements NewsRepository  )
@Injectable(as:NewsRepository )
class NewsRepositoryImpl implements NewsRepository{
  ///object from its twin the interface(repository=>data source)
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});///constructor injection
  ///constructor injection:
  ///Class depends on another class so we create object from it and pass it in constructor
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
  return remoteDataSource.getNewsBySourceId(sourceId);
  }

}