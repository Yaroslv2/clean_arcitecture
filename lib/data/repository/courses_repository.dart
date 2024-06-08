import 'package:clean_architecture/data/api/response/courses_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/service/courses_service.dart';
import 'package:clean_architecture/data/mapper/course_mapper.dart';
import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/domain/model/nested.dart';
import 'package:clean_architecture/internal/dependencies/module/service_module.dart';
import 'package:clean_architecture/internal/markdown_logic.dart';

class CourcesRepository {
  final CoursesService _coursesService = ServiceModule.coursesService;

  Future<List<Course>> getCourses() async {
    final MyResponse response = await _coursesService.getCourses();
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }

    final CoursesResponse coursesResponse = response as CoursesResponse;
    return List<Course>.from(
      coursesResponse.courses.map((i) => CourseMapper.fromJson(i)),
    );
  }

  Future<String> getCourseById({required int id}) async {
    final MyResponse response = await _coursesService.getCourseById(id: id);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }

    final CourseByIdResponse courseByIdResponse =
        response as CourseByIdResponse;
    if (courseByIdResponse.markdown == "") {
      throw Exception("Тут пока ничего нет");
    }
    return modifyMarkdown(markdown: courseByIdResponse.markdown);
  }

  Future<Nested> getNestedPageByLink({required String link}) async {
    final MyResponse response =
        await _coursesService.getNestedPageByLink(link: link);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }

    final NestedResponse nestedResponse = response as NestedResponse;
    if (link.contains("infos")) {
      return Info(
        id: nestedResponse.data["id"],
        courseId: nestedResponse.data["course_id"],
        markdown: modifyMarkdown(
          markdown: nestedResponse.data["markdown"] ?? "Здесь пока ничего нет",
        ),
        name: nestedResponse.data["name"],
      );
    }
    if (link.contains("labs")) {
      return Lab(
        id: nestedResponse.data["id"],
        courseId: nestedResponse.data["course_id"],
        opens: DateTimeExtension.parseUtc(nestedResponse.data["opens"]),
        closes: DateTimeExtension.parseUtc(nestedResponse.data["closes"]),
        topic: nestedResponse.data["topic"],
        attemts: nestedResponse.data["attempts"],
        locationId: nestedResponse.data["location_id"].toString(),
        example: nestedResponse.data["example"],
        requirements: nestedResponse.data["requirements"]
      );
    }
    if (link.contains("tests")) {
      return Test(
        id: nestedResponse.data["id"],
        courseId: nestedResponse.data["course_id"],
        opens: DateTimeExtension.parseUtc(nestedResponse.data["opens"]),
        closes: DateTimeExtension.parseUtc(nestedResponse.data["closes"]),
        taskCount: nestedResponse.data["tasks_count"],
        topic: nestedResponse.data["topic"],
        locationId: nestedResponse.data["location_id"].toString(),
        attemts: nestedResponse.data["attempts"],
        password: nestedResponse.data["password"],
        timeLimit: nestedResponse.data["time_limit"],
      );
    }

    throw Exception("Неизвестная ссылка");
  }
}

extension DateTimeExtension on DateTime {
  static DateTime parseUtc(String formattedDate) =>
      DateTime.parse('${formattedDate}');

  static DateTime? tryParseUtc(String? formattedDate) {
    if (formattedDate != null) {
      return DateTime.tryParse('${formattedDate}');
    }
    return null;
  }
}
