//todo:source repository=> impl=>concrete class
import 'package:injectable/injectable.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
///implements from the same(SourceRepositoryImpl implements SourceRepository  )
@Injectable(as:SourceRepository)///=>create object from the sub class because it is abstract like this:
/// SourceRepository sourceRepository=SourceRepositoryImpl(remoteDataSource: remoteDataSource)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;///create object from the interface without know the details
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}