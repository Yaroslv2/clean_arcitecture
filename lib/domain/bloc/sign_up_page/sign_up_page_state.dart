part of 'sign_up_page_bloc.dart';

class SignUpPageState {
  final List<Enviroment> enviroments;
  final List<Department> departments;
  final bool isDepsEnable;
  final bool isEnviromentsLoading;
  final bool isDepartmentsLoading;
  final bool isError;
  final String? errorMessage;

  SignUpPageState(
      {required this.enviroments,
      required this.departments,
      required this.isDepsEnable,
      required this.isEnviromentsLoading,
      required this.isDepartmentsLoading,
      required this.isError,
      required this.errorMessage});

  factory SignUpPageState.initial() => SignUpPageState(
        enviroments: [],
        departments: [],
        isDepsEnable: false,
        isEnviromentsLoading: true,
        isDepartmentsLoading: false,
        isError: false,
        errorMessage: null,
      );

  SignUpPageState copyWith({
    List<Enviroment>? enviroments,
    List<Department>? departments,
    bool? isDepsEnable,
    bool? isEnviromentsLoading,
    bool? isDepartmentsLoading,
    bool? isError,
    String? errorMessage,
  }) =>
      SignUpPageState(
        enviroments: enviroments ?? this.enviroments,
        departments: departments ?? this.departments,
        isDepsEnable: isDepsEnable ?? this.isDepsEnable,
        isEnviromentsLoading: isEnviromentsLoading ?? this.isEnviromentsLoading,
        isDepartmentsLoading: isDepartmentsLoading ?? this.isDepartmentsLoading,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
