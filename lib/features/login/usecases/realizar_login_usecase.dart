import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/login/models/usuario_model.dart';
import 'package:empresas_flutter/features/login/repository/login_repository.dart';

class RealizarLoginUseCase {
  final LoginRepository _loginRepository;

  RealizarLoginUseCase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  Future<Either<ApiResult, UsuarioModel>> call(
    String email,
    String password,
  ) async {
    return await _loginRepository.realizarLogin(email, password);
  }
}
