import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kerja_mudah/core/utilities/network/http_client.dart';

class CoreModule{
  static Future<void> init() async {
    GetIt.I.registerLazySingleton(() => Dio().initDio(GetIt.I()));
  }
}