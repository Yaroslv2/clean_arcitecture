import 'package:clean_architecture/data/api/response/my_reposnse.dart';

class SignInResponse extends MyResponse {
  String accessToken;
  String refreshToken;

  SignInResponse({
    required super.statusCode,
    required this.accessToken,
    required this.refreshToken,
  });
}
