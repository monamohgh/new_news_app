//todo:viewModel
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/ui/home/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;
 // late  NewsRemoteDataSource  remoteDataSource;
 // late ApiManager apiManager;
  NewsViewModel({required this.newsRepository}):super(NewsLoadingState()){///Constructor Injection
    ///The order if creating the objects is important(Dependency Chain)=>every object depends on the previous
    // apiManager =ApiManager();
    // remoteDataSource=NewsRemoteDataSourceImpl(apiManager: apiManager);///creating object from the subclasses=>polymorphism
    // newsRepository=NewsRepositoryImpl(remoteDataSource: remoteDataSource);///creating object from the subclasses=>polymorphism
  }
  //todo:hold data - handle logic
///hold data in state class
///the logic
void getNewsBySourceId(String sourceId)async{
  try{
   //todo:loading
    emit(NewsLoadingState());
    ///repository talk with data source from api=>newsRepository.getNewsBySourceId(sourceId);
    var response=await newsRepository.getNewsBySourceId(sourceId);
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