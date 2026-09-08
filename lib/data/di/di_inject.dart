///di with package
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
///@injectable=>create object explicitly=>بشكل واضح وصريح
///ex:SourceRepositoryImpl sourceRepositoryImpl=SourceRepositoryImpl(remoteDataSource: remoteDataSource)
///@Injectable=>create object from the sub class because SourceRepository is an abstract class
///ex: SourceRepository sourceRepository=SourceRepositoryImpl(remoteDataSource: remoteDataSource)