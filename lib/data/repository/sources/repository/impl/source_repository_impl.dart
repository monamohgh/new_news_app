//todo:source repository=> impl=>concrete class
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';

///implements from the same(SourceRepositoryImpl implements SourceRepository  )
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;

  ///create object from the interface without know the details
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  ///Constructor injection
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo:internet=>remote ds
      //todo:get sources by using remote ds
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      //todo:save sources(caching)
      localDataSource.saveSources(sourceResponse);
      return sourceResponse;
    } else {
      //todo:no internet=>local ds
      //todo:get sources by using local ds
      var sourceResponse = await localDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
