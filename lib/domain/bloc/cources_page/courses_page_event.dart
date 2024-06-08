part of 'courses_page_bloc.dart';

@immutable
sealed class CoursesPageEvent {
  const CoursesPageEvent();

  factory CoursesPageEvent.loadingCources() => _LoadingCources();
}

class _LoadingCources extends CoursesPageEvent {}


