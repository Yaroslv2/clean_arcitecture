part of 'course_page_bloc.dart';

class CoursePageState {
  final Course course;
  final CoursePageStatus courseTabStatus;
  final CoursePageStatus degreesTabStatus;
  final String? courseTabErrorMessage;
  final String? degreesTabErrorMessage;
  final String markdown;

  CoursePageState({
    required this.course,
    required this.courseTabStatus,
    required this.degreesTabStatus,
    required this.markdown,
    this.courseTabErrorMessage,
    this.degreesTabErrorMessage,
  });

  factory CoursePageState.initial({required Course course}) => CoursePageState(
        course: course,
        courseTabStatus: CoursePageStatus.nun,
        courseTabErrorMessage: null,
        degreesTabStatus: CoursePageStatus.nun,
        degreesTabErrorMessage: null,
        markdown: "",
      );

  CoursePageState copyWith({
    CoursePageStatus? courseTabStatus,
    CoursePageStatus? degreesTabStatus,
    String? courseTabErrorMessage,
    String? degreesTabErrorMessage,
    String? markdown,
  }) =>
      CoursePageState(
        course: course,
        courseTabStatus: courseTabStatus ?? this.courseTabStatus,
        degreesTabStatus: degreesTabStatus ?? this.degreesTabStatus,
        courseTabErrorMessage:
            courseTabErrorMessage ?? this.courseTabErrorMessage,
        degreesTabErrorMessage:
            degreesTabErrorMessage ?? this.degreesTabErrorMessage,
        markdown: markdown ?? this.markdown,
      );
}

enum CoursePageStatus { nun, loading, success, failure }
