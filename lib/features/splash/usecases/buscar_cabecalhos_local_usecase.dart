import 'package:empresas_flutter/features/login/models/cabecalho_model.dart';
import 'package:empresas_flutter/features/login/repository/login_repository.dart';

class BuscarCabecalhosLocalLoginUseCase {
  final LoginRepository _loginRepository;

  BuscarCabecalhosLocalLoginUseCase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  Future<CabecalhoModel> call() async {
    return await _loginRepository.buscarCabecalhosLocal();
  }
}
