part of 'courses_page_bloc.dart';

class CoursesPageState {
  final CoursesPageStatus state;
  final List<Course> courses;
  final String? errorMessage;

  CoursesPageState(
      {required this.state, required this.courses, this.errorMessage});

  factory CoursesPageState.initial() => CoursesPageState(
        state: CoursesPageStatus.nun,
        courses: [],
        errorMessage: null,
      );

  CoursesPageState copyWith({
    CoursesPageStatus? state,
    List<Course>? courses,
    String? errorMessage,
  }) =>
      CoursesPageState(
        state: state ?? this.state,
        courses: courses ?? this.courses,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

enum CoursesPageStatus { nun, loading, success, failure }
