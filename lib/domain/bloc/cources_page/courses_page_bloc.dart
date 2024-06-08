import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/repository/courses_repository.dart';
import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:meta/meta.dart';

part 'courses_page_event.dart';
part 'courses_page_state.dart';

class CoursesPageBloc extends Bloc<CoursesPageEvent, CoursesPageState> {
  final CourcesRepository _courcesRepository =
      RepositoryModule.courcesRepository;

  CoursesPageBloc() : super(CoursesPageState.initial()) {
    on<_LoadingCources>(_loadingCources);
  }

  _loadingCources(_LoadingCources event, Emitter<CoursesPageState> emit) async {
    emit(state.copyWith(state: CoursesPageStatus.loading));
    try {
      List<Course> courses = await _courcesRepository.getCourses();
      emit(state.copyWith(state: CoursesPageStatus.success, courses: courses));
    } catch (e) {
      emit(state.copyWith(
        state: CoursesPageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
