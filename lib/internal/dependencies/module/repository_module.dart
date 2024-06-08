import 'package:clean_architecture/data/repository/auth_repository.dart';
import 'package:clean_architecture/data/repository/courses_repository.dart';
import 'package:clean_architecture/data/repository/sign_up_page_repository.dart';
import 'package:clean_architecture/data/repository/token_repository.dart';
import 'package:clean_architecture/data/repository/user_repository.dart';

class RepositoryModule {
  static AuthRepository authRepository = AuthRepository();
  static UserRepository userRepository = UserRepository();
  static TokenRepository tokenRepository = TokenRepository();
  static CourcesRepository courcesRepository = CourcesRepository();
  static SignUpPageRepository signUpPageRepository = SignUpPageRepository();
}
