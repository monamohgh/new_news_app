// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_manager.dart' as _i149;
import '../../ui/home/category_details/cubit/source_view_model.dart' as _i317;
import '../../ui/home/category_details/news/cubit/news_view_model.dart'
    as _i744;
import '../repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart'
    as _i1014;
import '../repository/news/data_sources/remote/news_remote_data_source.dart'
    as _i114;
import '../repository/news/repository/impl/news_repository_impl.dart' as _i265;
import '../repository/news/repository/news_repository.dart' as _i251;
import '../repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart'
    as _i699;
import '../repository/sources/data_sources/remote/source_remote_data_source.dart'
    as _i1062;
import '../repository/sources/repository/impl/source_repository_impl.dart'
    as _i612;
import '../repository/sources/repository/source_repository.dart' as _i7;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i149.ApiManager>(() => _i149.ApiManager());
    gh.factory<_i1062.SourceRemoteDataSource>(
      () =>
          _i699.SourceRemoteDataSourceImpl(apiManager: gh<_i149.ApiManager>()),
    );
    gh.factory<_i114.NewsRemoteDataSource>(
      () => _i1014.NewsRemoteDataSourceImpl(apiManager: gh<_i149.ApiManager>()),
    );
    gh.factory<_i7.SourceRepository>(
      () => _i612.SourceRepositoryImpl(
        remoteDataSource: gh<_i1062.SourceRemoteDataSource>(),
      ),
    );
    gh.factory<_i251.NewsRepository>(
      () => _i265.NewsRepositoryImpl(
        remoteDataSource: gh<_i114.NewsRemoteDataSource>(),
      ),
    );
    gh.factory<_i317.SourceViewModel>(
      () => _i317.SourceViewModel(sourceRepository: gh<_i7.SourceRepository>()),
    );
    gh.factory<_i744.NewsViewModel>(
      () => _i744.NewsViewModel(newsRepository: gh<_i251.NewsRepository>()),
    );
    return this;
  }
}
