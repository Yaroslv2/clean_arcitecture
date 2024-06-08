import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:dio/dio.dart';

import 'package:clean_architecture/data/api/utils/middleware.dart';

class ApiUtil {
  final Dio dio = Dio(BaseOptions(
    baseUrl: HttpBackpoints.baseUrl,
    contentType: "application/json",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  ));

  ApiUtil() {
    dio.interceptors.add(Middleware());
  }
}
