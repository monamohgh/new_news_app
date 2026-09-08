//todo:viewModel=>cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/ui/home/category_details/cubit/source_states.dart';
///[ApiManager] ──> [SourceRemoteDataSourceImpl] ──> [SourceRepositoryImpl] ──> [SourceViewModel] ──> [UI States]
@injectable///=>create object explicitly
class  SourceViewModel extends Cubit<SourceStates>{
  ///SourceViewModel wants to know only the repository , there is no need to create object from the data source and apiManager
  ///Constructor Injection=>only create object from the class that the viewmodel cares about(SourceRepository  ) and pass it in the constructor
    SourceRepository sourceRepository;///object from interface
   // late SourceRemoteDataSource remoteDataSource;///object from interface
   // late ApiManager apiManager;
  SourceViewModel({required this.sourceRepository}):super(SourceLoadingStates()){
    ///The order if creating the objects is important(Dependency Chain)=>every object depends on the previous
    // apiManager=ApiManager();
    // remoteDataSource=SourceRemoteDataSourceImpl(apiManager: apiManager);///creating object from the subclasses=>polymorphism
    // sourceRepository=SourceRepositoryImpl(remoteDataSource: remoteDataSource);///creating object from the subclasses=>polymorphism
  }///super(initial state=>Loading)
//todo:view model=>hold data/handle logic
///hold data in source state class or here (view model)
// List<Source>?sourcesList;
// String? errorMessage;
///handle logic
void getSources(String categoryId)async{
  try{
    //todo:loading
    emit(SourceLoadingStates());
    //todo:call api
    ///repository talk with data source from api=>sourceRepository.getSources(categoryId);
    var response=await sourceRepository.getSources(categoryId);
    if(response.status=='error'){
      //todo:error
      // errorMessage=response.message!;
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