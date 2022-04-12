import 'package:dio/dio.dart';

class ResponseException {
  int? statusCode;
  String? message;
  DioErrorType? type;
  Response<dynamic>? response;

  ResponseException({this.statusCode, this.message, this.type, this.response});

  factory ResponseException.fromError(DioError error) {
    if(error.response?.data != null) {
      if(error.response?.data["code"] == 999){
        return ResponseException(
          statusCode: 999,
          message: "Please try again in a moment",
        );
      }else{
        return ResponseException(
          statusCode: (error.response?.data as Map<String, dynamic>?)?["code"]??error.response?.statusCode,
          message: (error.response?.data as Map<String, dynamic>?)?["message"]??error.message,
          type: error.type,
          response: error.response,
        );
      }
    }else{
      return ResponseException(
        statusCode: error.response?.statusCode,
        message: error.message,
        type: error.type,
        response: error.response,
      );
    }
  }
}
