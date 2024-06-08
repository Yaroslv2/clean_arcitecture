class LogoutBody {
  final String refresh;

  LogoutBody({required this.refresh});

  Map<String, dynamic> toJson() => {
        "refresh_token": refresh,
      };
}
