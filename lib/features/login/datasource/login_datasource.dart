import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/configs/utils/Endpoint.dart';
import 'package:empresas_flutter/configs/utils/LocalStorage.dart';
import 'package:empresas_flutter/configs/utils/RequestApiProvider.dart';

abstract class ILoginDataSource {
  Future<ApiResult> realizarLogin({Map<String, dynamic> body});
  Future<void> salvarCabecalhosLocal(
    String uid,
    String client,
    String accessToken,
  );
  Future<dynamic> buscarCabecalhoLocal(String chave);
  Future<void> limparCabecalhosLocal();
}

class LoginDataSource implements ILoginDataSource {
  final RequestApiProvider _requestApiProvider;
  final ILocalStorage _localStorage;

  LoginDataSource({
    required apiProvider,
    required localStorage,
  })  : _requestApiProvider = apiProvider,
        _localStorage = localStorage;

  @override
  Future<ApiResult> realizarLogin({Map<String, dynamic>? body}) async {
    return await _requestApiProvider.execute(
      Endpoint(
        data: body,
        method: EndPointMethod.post,
        url: '/v1/users/auth/sign_in',
        headers: {},
        queryParameters: {},
      ),
    );
  }

  @override
  Future<void> salvarCabecalhosLocal(
    String uid,
    String client,
    String accessToken,
  ) async {
    await this._localStorage.save('uid', uid);
    await this._localStorage.save('client', client);
    await this._localStorage.save('access-token', accessToken);
  }

  @override
  Future<void> limparCabecalhosLocal() async {
    await this._localStorage.remove('uid');
    await this._localStorage.remove('client');
    await this._localStorage.remove('access-token');
  }

  @override
  Future<dynamic> buscarCabecalhoLocal(String chave) async {
    return await this._localStorage.read(chave);
  }
}
