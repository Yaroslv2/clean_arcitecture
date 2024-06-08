import 'package:clean_architecture/data/api/utils/api_util.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil();

    return _apiUtil!;
  }
}
