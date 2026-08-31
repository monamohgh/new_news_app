//todo:viewModel=>provider
import 'package:flutter/cupertino.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news/news.dart';

class NewsViewModel extends ChangeNotifier {
  //todo:hold data/handle logic
  /// the data
  List<News>? newsList;
  String? errorMessage;
  bool isLoading = false;

  /// the logic
  void getNewsBySourceId(String sourceId) async {
    try {
      //todo:loading
      isLoading = true;
      var newsResponse = await ApiManager.getNewsBySourceId(sourceId);
      if (newsResponse.status == 'error') {
        //todo:server response=>error
        isLoading = false;
        errorMessage = newsResponse.message!;
      } else {
        //todo:server response=>success=>data
        isLoading = false;
        newsList = newsResponse.articles!;
        }
    } catch (e) {
      isLoading=false;
      errorMessage=e.toString();
    }
    notifyListeners();
  }
}
