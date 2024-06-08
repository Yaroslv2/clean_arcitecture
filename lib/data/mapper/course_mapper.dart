import 'package:clean_architecture/data/api/model/course_api.dart';
import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/domain/model/teacher.dart';

class CourseMapper {
  static Course fromJson(CourseApi course) {
    Teacher teacher = Teacher(
      name: course.teacher["name"],
      patronymic: course.teacher["patronymic"],
      surname: course.teacher["surname"],
      department: course.teacher["department"],
    );
    return Course(
      id: course.id,
      name: course.name,
      term: course.term,
      teacher: teacher,
      department: course.department,
      modifyAt: DateTime.fromMillisecondsSinceEpoch(course.modifyTime),
    );
  }
}
