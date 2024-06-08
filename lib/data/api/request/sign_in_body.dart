class SignInBody {
  final String email;
  final String password;

  SignInBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
