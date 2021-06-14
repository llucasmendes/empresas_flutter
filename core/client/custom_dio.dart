import 'package:dio/dio.dart';

import 'request_header_interceptor.dart';
import 'request_log_Interceptor.dart';

class CustomDio {
  Dio client;
  CustomDio() {
    client = Dio();
    client.options.baseUrl = 'https://empresas.ioasys.com.br/api';
    client.interceptors.add(
      RequestHeaderInterceptor(),
    );
    client.interceptors.add(ResquestLogInterceptor());

    client.options.connectTimeout = 30000;
    client.options.receiveTimeout = 30000;
    client.options.validateStatus = validateStatus;
  }

  bool validateStatus(status) {
    return status < 500;
  }
}
