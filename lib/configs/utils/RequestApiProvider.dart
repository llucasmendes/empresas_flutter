import 'dart:async';
import 'package:dio/dio.dart';

import 'package:empresas_flutter/configs/client/check_connectivty.dart';
import 'package:empresas_flutter/configs/client/custom_dio.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/configs/utils/Endpoint.dart';
import 'package:empresas_flutter/injection_container.dart';

class RequestApiProvider {
  CustomDio _customDio;

  RequestApiProvider({
    required CustomDio customDio,
  }) : _customDio = customDio;

  Future<ApiResult> execute(Endpoint endpoint) async {
    try {
      final possuiInternet =
          await dependencia<LocalConnectivity>().checkConnection();
      if (!possuiInternet)
        return NoInternet(data: {}, message: '', statusCode: 1);

      Response response;
      switch (endpoint.method) {
        case EndPointMethod.get:
          response = await getAsync(endpoint.finalUrl());
          break;
        case EndPointMethod.post:
          response = await post(endpoint.url, endpoint.data);
          break;
        case EndPointMethod.delete:
          response = await delete(endpoint.data, endpoint.data);
          break;
        case EndPointMethod.put:
          response = await put(endpoint.data, endpoint.data);
          break;
        case EndPointMethod.patch:
          response = await patch(endpoint.url, endpoint.data);
          break;
        default:
          return Failure(
            statusCode: 1,
            message: 'Method Invalid',
            data: {},
          );
      }

      if (response.data != null && response.statusCode! < 300) {
        final Map<String, dynamic> responseHeaders = {
          "uid": response.headers.value('uid'),
          "client": response.headers.value("client"),
          "access-token": response.headers.value("access-token"),
        };
        return response.data is List
            ? Success(
                dataList: response.data,
                statusCode: response.statusCode as int,
                responseHeaders: responseHeaders,
                data: {},
              )
            : Success(
                data: response.data is Map ? response.data : {"resp": true},
                statusCode: response.statusCode as int,
                responseHeaders: responseHeaders,
                dataList: [],
              );
      }

      return Failure(
        statusCode: response.statusCode as int,
        message: response.statusMessage as String,
        data: response.data,
      );
    } catch (_) {
      return ApiError(
        statusCode: 1,
        message: "",
        data: {},
      );
    }
  }

  Future<Response> post(
    String url,
    dynamic objeto,
  ) async {
    return await _customDio.client.post(url, data: objeto);
  }

  Future<Response> put(
    String url,
    dynamic objeto,
  ) async {
    return await _customDio.client.put(url, data: objeto);
  }

  Future<Response> delete(
    String url,
    dynamic objeto,
  ) async {
    return await _customDio.client.delete(url, data: objeto);
  }

  Future<Response> patch(
    String url,
    dynamic objeto,
  ) async {
    return await _customDio.client.patch(url, data: objeto);
  }

  Future<Response> getAsync(
    String url,
  ) async {
    return await _customDio.client.get(url);
  }
}
