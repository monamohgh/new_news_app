//todo:viewModel => state management(observable => have data )
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/source/source.dart';

class SourceViewModel extends ChangeNotifier{
  //todo:view model:hold data/handel logic
  /// the data
  List<Source>? sourcesList;
  String? errorMessage;
  bool isLoading =false;
  /// the logic
  void getSources(String categoryId)async{
    //todo:reinitialize=>when error happen and click rty again=>show loading
    sourcesList=null;//show loading
    errorMessage=null;
    isLoading=false;
    notifyListeners();
try{
  //todo:loading
  isLoading=true;
  var sourceResponse=await ApiManager.getSources(categoryId);
  if(sourceResponse.status=='error'){
    //todo:server response=>error
    isLoading=false;
     errorMessage=sourceResponse.message!;
  }else{
    //todo:server response=>success=>data
    isLoading=false;
    sourcesList=sourceResponse.sources!;
  }
}catch(e){
  ///error from the client not from the server
  isLoading=false;
errorMessage=e.toString();
}
notifyListeners();
  }


}
