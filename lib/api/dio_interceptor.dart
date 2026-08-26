import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';

class DioInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    print('baseUrl:${options.baseUrl}');
    options.headers.addAll({
      'X-Api-Key':ApiConstants.apiKey
    });
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    print('onErrorInterceptor:${err.error.toString()}');
    print('errorMessage :${err.message}');
    super.onError(err, handler);
  }
   
}
// class DioInterceptor extends InterceptorsWrapper {
// @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // TODO: implement onRequest
//     super.onRequest(options, handler);
//   }
//   @override
//   void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);
//   }
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // TODO: implement onError
//     super.onError(err, handler);
//   }
// }