import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home/category_details/source/source_view_model.dart';
import 'package:news_app/ui/home/category_details/source/source_widget.dart';
import 'package:news_app/ui/home/widget/main_error_widget.dart';
import 'package:news_app/ui/home/widget/main_loading_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  ///view=>observer
  ///every view(UI=>_CategoryDetailsState) know its view model(SourceViewModel)=>have object from the viewmodel
  SourceViewModel viewModel = SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      ///Consumer=>listen to the view model
      child: Consumer<SourceViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            //todo:loading
            return MainLoadingWidget();
          } else if (viewModel.errorMessage != null) {
            //todo:error
            return MainErrorWidget(
              errorMessage: viewModel.errorMessage!,
              onPressed: () {
                //todo:try again
                viewModel.getSources(widget.category.id);
              },
            );
          }else if(viewModel.sourcesList==null){
            return MainLoadingWidget();
          }else{
            //todo:success
                    var sourcesList = viewModel.sourcesList ??[];
                    return SourceWidget(sourcesList: sourcesList);
          }
        },
      ),
      // FutureBuilder<SourceResponse>(
      //   future: ApiManager.getSources(widget.category.id),
      //   builder: (context, snapshot) {
      //     //todo:loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return MainLoadingWidget();
      //     } else if (snapshot.hasError) {
      //       //todo:error
      //       return MainErrorWidget(
      //         errorMessage: AppLocalizations.of(context)!.something_went_wrong,
      //         onPressed: () {
      //           //todo:try again
      //           ApiManager.getSources(widget.category.id);
      //           setState(() {});
      //         },
      //       );
      //     } else {
      //       //todo:server has response with data
      //       //todo:response=>success,error
      //       if (snapshot.data?.status != 'ok') {
      //         //todo:server=>response=>error
      //         return MainErrorWidget(
      //           errorMessage: snapshot.data!.message!,
      //           onPressed: () {
      //             //todo:try again
      //             ApiManager.getSources(widget.category.id);
      //             setState(() {});
      //           },
      //         );
      //       } else {
      //         //todo:server=>response=>success
      //         var sourcesList = snapshot.data?.sources ?? [];
      //         return SourceWidget(sourcesList: sourcesList);
      //       }
      //     }
      //   },
      // ),
    );
  }
}
