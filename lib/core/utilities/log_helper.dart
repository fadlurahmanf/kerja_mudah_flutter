import 'package:logger/logger.dart';

logd(dynamic data) {
  var logger = Logger();
  logger.d(data);
}

loge(dynamic data) {
  var logger = Logger();
  logger.e(data);
}

logi(dynamic data, {String? text}) {
  var logger = Logger();
  logger.i("${text ?? ''}\n$data");
}

logw(dynamic data) {
  var logger = Logger();
  logger.w(data);
}

logv(dynamic data) {
  var logger = Logger();
  logger.v(data);
}

logwtf(dynamic data) {
  var logger = Logger();
  logger.wtf(data);
}