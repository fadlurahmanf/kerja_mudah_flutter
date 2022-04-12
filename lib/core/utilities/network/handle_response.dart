import 'package:dio/dio.dart';
import 'package:kerja_mudah/core/utilities/network/response_exception.dart';

Future<T> handleResponse<T>(
    {required Future<Response<dynamic>> Function() request,
      required T Function(Response<dynamic>) onSuccess}) async {
  try {
    final result = await request();
    return onSuccess(result);
  } on DioError catch (e) {
    var error = ResponseException.fromError(e);
    throw ResponseException.fromError(e);
  } catch (e) {
    var message = e.toString();
    throw message;
  }
}
