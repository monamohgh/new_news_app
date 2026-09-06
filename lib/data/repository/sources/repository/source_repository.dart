//todo:source repository=>interface
import 'package:news_app/api/model/source/source_response.dart';

///interface=> abstract class all methods is abstract
///Every repository have data source (twin)
///we make interface to the repository and every types of  data sources
///Types of data sources:
///1- Remote
///2- Local
abstract class SourceRepository {
Future<SourceResponse>getSources(String categoryId);///abstract method
}