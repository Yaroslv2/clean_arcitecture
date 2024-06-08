import 'dart:convert';

import 'package:dio/dio.dart';

class MyResponse {
  final int statusCode;

  MyResponse({required this.statusCode});
}

class FailureResponse extends MyResponse {
  String errorMessage;

  FailureResponse({
    required super.statusCode,
    required this.errorMessage,
  });
}

FailureResponse formFailureResponse(DioException e) {
  if (e.response == null) {
    return FailureResponse(
        statusCode: 0, errorMessage: "Нет подключения к интернету");
  }
  Map<String, dynamic> response = json.decode(e.response!.data);
  return FailureResponse(
    statusCode: e.response!.statusCode!,
    errorMessage: response["Error"] ?? "Unexpected error",
  );
}
