part of 'course_page_bloc.dart';

@immutable
sealed class CoursePageEvent {
  const CoursePageEvent();

  factory CoursePageEvent.loadData() => _LoadDataEvent();
}

class _LoadDataEvent extends CoursePageEvent {}