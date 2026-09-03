//todo:viewModel=>cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/source/source.dart';
import 'package:news_app/ui/home/category_details/cubit/source_states.dart';

class  SourceViewModel extends Cubit<SourceStates>{
  SourceViewModel():super(SourceLoadingStates());///super(initial state=>Loading)
//todo:view model=>hold data/handle logic
///hold data in source state class or here (view model)
List<Source>?sourcesList;
String? errorMessage;
///handle logic
void getSources(String categoryId)async{
  try{
    //todo:loading
    emit(SourceLoadingStates());
    //todo:call api
    var response=await ApiManager.getSources(categoryId);
    if(response.status=='error'){
      //todo:error
      emit(SourceErrorStates(errorMessage: response.message!));
      return;
    }
    if(response.status=='ok'){
      //todo:success
   emit(SourceSuccessStates(sourcesList: response.sources!));
   return;
    }
  }catch(e){
    //todo:error
    emit(SourceErrorStates(errorMessage: e.toString()));

  }
}

}