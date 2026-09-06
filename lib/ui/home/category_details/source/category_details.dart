import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/ui/home/category_details/cubit/source_states.dart';
import 'package:news_app/ui/home/category_details/cubit/source_view_model.dart';
import 'package:news_app/ui/home/category_details/source/source_widget.dart';
import 'package:news_app/ui/home/widget/main_error_widget.dart';
import 'package:news_app/ui/home/widget/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  ///CategoryDetails=>View=>UI
  ///every view know its view model by creating object from it (view model)
  SourceViewModel viewModel = SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///BlocBuilder<BlocA, BlocAState>
      ///BlocProvider=>create the bloc that I use it=> viewModel type of the bloc SourceViewModel
      /// we use:
      /// 1-BlocProvider=>When there is more then one screens use the bloc like theme and language
      /// 2-bloc:viewModel=>When there is only one screen use the bloc
      /// Note/we cant use it together
    create: ( context)=>viewModel,
    child: BlocBuilder<SourceViewModel, SourceStates>(
      // bloc: viewModel,
        builder: (context, state) {
          ///state object from the parent
          ///to check the object type =>is
          if (state is SourceLoadingStates) {
            //todo:loading
            return MainLoadingWidget();
          } else if (state is SourceErrorStates) {
            //TODO:error
            return MainErrorWidget(
                errorMessage: state.errorMessage,
                onPressed: () {
                  //todo:try again
                  viewModel.getSources(widget.category.id);
                }
            );
          } else if (state is SourceSuccessStates) {
            //todo:success
            var sourcesList = state.sourcesList;
            return SourceWidget(sourcesList: sourcesList);

          }
          return Container();///unreachable
        },

      ),
    );
    //   FutureBuilder<SourceResponse>(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (context, snapshot){
    //       //todo:loading
    //       if(snapshot.connectionState==ConnectionState.waiting){
    //         return MainLoadingWidget();
    //       }else if(snapshot.hasError){
    //         //todo:error
    //         return MainErrorWidget(
    //             errorMessage: AppLocalizations.of(context)!.something_went_wrong,
    //             onPressed: (){
    //               //todo:try again
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {
    //
    //                 });
    //             }
    //         );
    //       }else{
    //         //todo:server has response with data
    //         //todo:response=>success,error
    //         if(snapshot.data?.status!='ok'){
    //           //todo:server=>response=>error
    //           return MainErrorWidget(
    //               errorMessage: snapshot.data!.message!,
    //               onPressed: (){
    //                 //todo:try again
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {
    //
    //                 });
    //
    //               }
    //           );
    //         }else{
    //           //todo:server=>response=>success
    //           var sourcesList=snapshot.data?.sources??[];
    //           return SourceWidget(sourcesList: sourcesList);
    //
    //         }
    //       }
    //     },
    // );
  }
}
