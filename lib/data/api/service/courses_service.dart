import 'dart:convert';

import 'package:clean_architecture/data/api/model/course_api.dart';
import 'package:clean_architecture/data/api/response/courses_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/utils/api_util.dart';
import 'package:clean_architecture/data/api/utils/middleware.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:clean_architecture/internal/dependencies/module/api_module.dart';
import 'package:dio/dio.dart';

class CoursesService {
  final Dio _dio = Dio(BaseOptions(
    contentType: "application/json",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  ));
  final ApiUtil _api = ApiModule.apiUtil();

  CoursesService() {
    _dio.interceptors.add(Middleware());
  }

  Future<MyResponse> getCourses() async {
    try {
      Response response = await _api.dio.get(
        HttpBackpoints.getUserCourcesUrl,
        options: Options(
          headers: {
            "needToken": true,
          },
        ),
      );
      response.data = json.decode(response.data);
      return CoursesResponse(
        statusCode: response.statusCode!,
        courses: List<CourseApi>.from(
          response.data.map((i) => CourseApi.fromJson(i)),
        ),
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> getCourseById({required int id}) async {
    try {
      Response response = await _api.dio.get(
        HttpBackpoints.getCourseByIdUrl + id.toString(),
        options: Options(
          headers: {
            "needToken": true,
          },
        ),
      );

      response.data = json.decode(response.data);
      return CourseByIdResponse(
          statusCode: response.statusCode!,
          markdown: response.data["markdown"] ?? "");
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> getNestedPageByLink({required String link}) async {
    try {
      Response response = await _dio.get(
        link,
        options: Options(
          headers: {
            "needToken": true,
          },
        ),
      );
      return NestedResponse(
          statusCode: response.statusCode!, data: json.decode(response.data));
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }
}
