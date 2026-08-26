import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/api/model/news/news_response.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
    final Dio dio = Dio(
     /// we use BaseOptions when we have common things between APIs
      BaseOptions(
          baseUrl: 'https://newsapi.org',
        queryParameters: {
          'apiKey':ApiConstants.apiKey,
        },
        sendTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
      )
   );
   /// The first way(..) adding the PrettyDioLogger before returning the object
   //   ..interceptors.add(PrettyDioLogger(
   //     requestHeader: true,
   //     requestBody: true,
   //     responseBody: true,
   //     responseHeader: false,
   // )
   // );
   /// The second way in the constructor
   /// but to execute the PrettyDioLogger by the constructor we should call the constructor DioManager
   DioManager(){
     dio.interceptors.add(PrettyDioLogger(
           requestHeader: true,
           requestBody: true,
           responseBody: true,
           responseHeader: false,
       )
       );
   }

/*https://newsapi.org/v2/top-headlines/sources?apiKey=
  864cbf8e0e4e451da80a4f3b02de5cf9
  */
 Future<SourceResponse> getSources(String categoryId)async{
  try{
    var response=await dio.get(EndPoints.sourceApi,
        queryParameters:{
          'category':categoryId
        }
    );
    /// there is no need to convert data to json because data is json
    return SourceResponse.fromJson(response.data);
  }catch(e){
    rethrow;
  }


}
/*https://newsapi.org/v2/everything?q=bitcoin&apiKey=
864cbf8e0e4e451da80a4f3b02de5cf9*/
 Future<NewsResponse> getNewsBySourceId(String sourceId)async{
  try{
   var response=await dio.get(EndPoints.newsApi,
  queryParameters: {
    'sources':sourceId,
  }
  );
    return NewsResponse.fromJson(response.data);
  }catch(e){
    rethrow;
  }
}
}
