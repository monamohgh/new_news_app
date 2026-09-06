//todo:viewModel
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel():super(NewsLoadingState());
  //todo:hold data - handle logic
///hold data in state class
///the logic
void getNewsBySourceId(String sourceId)async{
  try{
   //todo:loading
    emit(NewsLoadingState());
    var response=await ApiManager.getNewsBySourceId(sourceId);
    if(response.status=='error'){
      //todo:error
      emit(NewsErrorState(errorMessage: response.message!));
    } if(response.status=='ok'){
      //todo:success
      emit(NewsSuccessState(newsList: response.articles!));
    }
  }catch(e){
  //todo:error
  emit(NewsErrorState(errorMessage: e.toString()));
  }

}
}