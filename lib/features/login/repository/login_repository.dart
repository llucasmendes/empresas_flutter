import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/login/datasource/login_datasource.dart';
import 'package:empresas_flutter/features/login/models/cabecalho_model.dart';
import 'package:empresas_flutter/features/login/models/login_model.dart';
import 'package:empresas_flutter/features/login/models/usuario_model.dart';
import 'package:empresas_flutter/features/login/repository/login_decode_helper.dart';

class LoginRepository {
  LoginRepository({
    required loginDataSource,
    required loginDecodeHelper,
  })  : _dataSource = loginDataSource,
        _decodeHelper = loginDecodeHelper;

  final ILoginDataSource _dataSource;
  final LoginDecodeHelper _decodeHelper;

  Future<Either<ApiResult, UsuarioModel>> realizarLogin(
    String email,
    String password,
  ) async {
    final loginModel = LoginModel(
      email: email,
      password: password,
    );

    final result = await this._dataSource.realizarLogin(
          body: loginModel.toJson(),
        );
    return _decodeHelper.decodeLogin(result: result);
  }

  void salvarCabecalhosLocal(
    String uuid,
    String client,
    String accessToken,
  ) async {
    this._dataSource.salvarCabecalhosLocal(uuid, client, accessToken);
  }

  Future<void> limparCabecalhosLocal() async {
    await this._dataSource.limparCabecalhosLocal();
  }

  Future<CabecalhoModel> buscarCabecalhosLocal() async {
    final uid = await this._dataSource.buscarCabecalhoLocal('uid');
    final client = await this._dataSource.buscarCabecalhoLocal('client');
    final accessToken =
        await this._dataSource.buscarCabecalhoLocal('access-token');

    final cabecalho = CabecalhoModel(
      uid: uid,
      client: client,
      acessToken: accessToken,
    );

    return cabecalho;
  }
}
