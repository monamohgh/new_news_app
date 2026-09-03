import 'package:news_app/api/model/source/source.dart';

///Every state represents with class:initial/loading/error/success
abstract class SourceStates {}//todo:parent
class SourceInitialStates extends SourceStates  {}///initial state=>first state before any change happens
class SourceLoadingStates extends SourceStates{}
class SourceErrorStates extends SourceStates{
String errorMessage;
SourceErrorStates({required this.errorMessage});
}
class SourceSuccessStates extends SourceStates{
  List<Source>sourcesList;
  SourceSuccessStates({required this.sourcesList});
}