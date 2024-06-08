import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/repository/courses_repository.dart';
import 'package:clean_architecture/domain/model/nested.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:meta/meta.dart';

part 'nested_page_event.dart';
part 'nested_page_state.dart';

class NestedPageBloc extends Bloc<NestedPageEvent, NestedPageState> {
  final CourcesRepository _courcesRepository =
      RepositoryModule.courcesRepository;
  NestedPageBloc() : super(NestedPageState.initial()) {
    on<_LoadingNestedPage>(_loadingNestedPage);
  }

  _loadingNestedPage(
    _LoadingNestedPage event,
    Emitter<NestedPageState> emit,
  ) async {
    try {
      emit(state.copyWith(status: NestedPageStatus.loading));
      Nested nested =
          await _courcesRepository.getNestedPageByLink(link: event.link);

      emit(state.copyWith(nested: nested, status: NestedPageStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: NestedPageStatus.failure, errorMessage: e.toString()));
    }
  }
}
