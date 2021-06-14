import 'package:empresas_flutter/features/login/repository/login_repository.dart';

class GravarCabecalhosLocalLoginUseCase {
  final LoginRepository _loginRepository;

  GravarCabecalhosLocalLoginUseCase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  void call(String uuid, String client, String accessToken) {
    return _loginRepository.salvarCabecalhosLocal(uuid, client, accessToken);
  }
}
