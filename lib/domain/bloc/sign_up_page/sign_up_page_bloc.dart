import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/repository/sign_up_page_repository.dart';
import 'package:clean_architecture/domain/model/department.dart';
import 'package:clean_architecture/domain/model/enviroment.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:meta/meta.dart';

part 'sign_up_page_event.dart';
part 'sign_up_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  final SignUpPageRepository _repository =
      RepositoryModule.signUpPageRepository;

  SignUpPageBloc() : super(SignUpPageState.initial()) {
    on<_GetEnviroments>(_getEnviroments);
    on<_GetDepartments>(_getDepartments);
    on<_ChangeDepsActivity>(_changeDepsActivity);
  }

  _getEnviroments(_GetEnviroments event, Emitter<SignUpPageState> emit) async {
    try {
      emit(state.copyWith(isEnviromentsLoading: true));
      List<Enviroment> envs = await _repository.getEnviroments();
      emit(state.copyWith(isEnviromentsLoading: false, enviroments: envs));
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
    }
  }

  _getDepartments(_GetDepartments event, Emitter<SignUpPageState> emit) async {
    try {
      emit(state.copyWith(isDepartmentsLoading: true, isDepsEnable: false));
      List<Department> deps = await _repository.getDepartments(envId: event.id);
      emit(state.copyWith(
          isDepartmentsLoading: false, departments: deps, isDepsEnable: true));
    } catch (e) {
      emit(state.copyWith(isError: true, errorMessage: e.toString()));
    }
  }

  _changeDepsActivity(
      _ChangeDepsActivity event, Emitter<SignUpPageState> emit) async {
    emit(state.copyWith(isDepsEnable: event.isActive));
  }
}
