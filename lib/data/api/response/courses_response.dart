import 'package:clean_architecture/data/api/model/course_api.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';

class CoursesResponse extends MyResponse {
  final List<CourseApi> courses;
  CoursesResponse({required super.statusCode, required this.courses});
}

class CourseByIdResponse extends MyResponse {
  final String markdown;
  CourseByIdResponse({required super.statusCode, required this.markdown});
}

class NestedResponse extends MyResponse {
  final Map<String, dynamic> data;

  NestedResponse({required super.statusCode, required this.data});
}
