import 'package:empresas_flutter/features/login/repository/login_repository.dart';

class LimparCabecalhosLocalLoginUseCase {
  final LoginRepository _loginRepository;

  LimparCabecalhosLocalLoginUseCase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  Future<void> call() async {
    return _loginRepository.limparCabecalhosLocal();
  }
}
