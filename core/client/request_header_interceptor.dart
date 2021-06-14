import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends Interceptor {
  RequestHeaderInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final _buscarCabecalhosLocalLoginUseCase =
        dependencia<BuscarCabecalhosLocalLoginUseCase>();
    final cabecalho = await _buscarCabecalhosLocalLoginUseCase();
    options.headers["uid"] = cabecalho.uid;
    options.headers["access-token"] = cabecalho.acessToken;
    options.headers["client"] = cabecalho.client;
    return options;
  }
}
