part of 'sign_up_page_bloc.dart';

@immutable
sealed class SignUpPageEvent {
  const SignUpPageEvent();

  factory SignUpPageEvent.getEnvs() => _GetEnviroments();
  factory SignUpPageEvent.getDeps({required int id}) => _GetDepartments(id: id);
  factory SignUpPageEvent.changeDepsActivity({required bool isActive}) =>
      _ChangeDepsActivity(isActive: isActive);
}

class _GetEnviroments extends SignUpPageEvent {}

class _GetDepartments extends SignUpPageEvent {
  final int id;

  _GetDepartments({required this.id});
}

class _ChangeDepsActivity extends SignUpPageEvent {
  final bool isActive;

  _ChangeDepsActivity({required this.isActive});
}
