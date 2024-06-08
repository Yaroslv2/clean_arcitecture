import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/repository/courses_repository.dart';
import 'package:clean_architecture/domain/model/course.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:meta/meta.dart';

part 'course_page_event.dart';
part 'course_page_state.dart';

class CoursePageBloc extends Bloc<CoursePageEvent, CoursePageState> {
  final CourcesRepository _courcesRepository =
      RepositoryModule.courcesRepository;

  CoursePageBloc({required Course course})
      : super(CoursePageState.initial(course: course)) {
    on<_LoadDataEvent>(_loadData);
  }

  _loadData(_LoadDataEvent event, Emitter<CoursePageState> emit) async {
    try {
      emit(state.copyWith(courseTabStatus: CoursePageStatus.loading));
      String markdown =
          await _courcesRepository.getCourseById(id: state.course.id);
      emit(state.copyWith(
        courseTabStatus: CoursePageStatus.success,
        markdown: markdown,
      ));
    } catch (e) {
      emit(state.copyWith(
        courseTabStatus: CoursePageStatus.failure,
        courseTabErrorMessage: e.toString(),
      ));
    }
  }
}
