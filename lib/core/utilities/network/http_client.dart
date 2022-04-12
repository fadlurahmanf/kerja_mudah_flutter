import 'package:dio/dio.dart';
import 'package:kerja_mudah/core/data/datasource/build_config.dart';
import 'package:kerja_mudah/core/utilities/log_helper.dart';

extension KerjaMudahDio on Dio {
  Dio initDio(BuildConfig buildConfig) {
    options.baseUrl = buildConfig.baseUrl;
    options.connectTimeout = 8000;
    options.receiveTimeout = 8000;
    if (buildConfig.debug) interceptors.add(LogInterceptor(responseBody: true));
    // interceptors.add(ApiInterceptors());
    interceptors.add(InterceptorsWrapper(
        onRequest: (reqOptions, handler) => requestInterceptor(reqOptions, handler),
        onResponse: (respOptions, handler) => responseInterceptor(respOptions, handler),
        onError: (DioError dioError, handler) => errorInterceptor(dioError, handler)
    ));
    return this;
  }

  dynamic requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    var customHeaders = {
      "Content-Type": "application/json"
    };
    options.headers.addAll(customHeaders);
    logd("API_URI: ${options.uri.toString()}\nAPI_DATA: ${options.data.toString()}\nAPI_HEADER: ${options.headers.toString()}");
    handler.next(options);
    return options;
  }

  dynamic responseInterceptor(Response response, ResponseInterceptorHandler handler) async {
    logd("API_Response:\n$response");
    handler.next(response);
  }

  dynamic errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) async{
    // if(dioError.response?.statusCode == 401){
    //   await resetToken();
    //   if(gets.Get.isDialogOpen == true || gets.Get.isBottomSheetOpen == true){
    //     gets.Get.back();
    //   }
    //   gets.Get.offAll(GuestModeScreen());
    // }
    loge("API_Error:\n${dioError.toString()}\nERROR_DATA:\n${dioError.response?.data.toString()}");
    handler.next(dioError);
    return dioError;
  }
}