import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/configs/utils/Endpoint.dart';
import 'package:empresas_flutter/configs/utils/RequestApiProvider.dart';

abstract class IEmpresasDataSource {
  Future<ApiResult> buscarEmpresas(String termoBusca);
}

class EmpresasDataSource implements IEmpresasDataSource {
  final RequestApiProvider _requestApiProvider;

  EmpresasDataSource({
    required RequestApiProvider apiProvider,
  }) : _requestApiProvider = apiProvider;

  @override
  Future<ApiResult> buscarEmpresas(String termoBusca) async {
    return await _requestApiProvider.execute(
      Endpoint(
        data: null,
        queryParameters: <String, dynamic>{'name': termoBusca},
        method: EndPointMethod.get,
        url: '/v1/enterprises',
        headers: {},
      ),
    );
  }
}
