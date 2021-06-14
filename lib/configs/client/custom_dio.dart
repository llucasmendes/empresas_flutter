import 'package:dio/dio.dart';
import 'package:empresas_flutter/configs/client/request_header_interceptor.dart';
import 'package:empresas_flutter/configs/client/request_log_Interceptor.dart';

class CustomDio {
  late final Dio client;
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
