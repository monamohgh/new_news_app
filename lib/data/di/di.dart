//todo:di=>Dependency Injection
//todo:SourceView => Object  SourceViewModel
//todo:SourceViewModel => Object  SourceRepository
//todo:SourceRepository => Object  SourceRemoteDs
//todo:SourceRemoteDs => Object  ApiManager
import 'package:news_app/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';

import '../../api/api_manager.dart';
import '../repository/sources/data_sources/remote/source_remote_data_source.dart';

///Create function to return every type I need
SourceRepository injectSourceRepository(){///function type is interface class
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());///return type impl class
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
// ApiManager injectApiManager(){
//   return ApiManager();
// }
//todo:NewsView => Object  NewsViewModel
//todo:NewsViewModel => Object  NewsRepository
//todo:NewsRepository => Object  NewsRemoteDs
//todo:NewsRemoteDs => Object  ApiManager
NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
