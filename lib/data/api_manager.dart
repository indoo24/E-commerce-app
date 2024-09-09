import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint, {Map<String, dynamic>? query}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        queryParameters: query,
        options: Options(
          validateStatus: (status) => true,
        ));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        queryParameters: query,
        options: Options(
          validateStatus: (status) => true,
        ));
  }
}
