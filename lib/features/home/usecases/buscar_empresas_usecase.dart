import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';
import 'package:empresas_flutter/features/home/repository/empresas_repository.dart';

class BuscarEmpresasUseCase {
  EmpresasRepository _empresasRepository;
  BuscarEmpresasUseCase({required EmpresasRepository empresasRepository})
      : _empresasRepository = empresasRepository;

  Future<Either<ApiResult, EmpresasModel>> call(String termoBusca) async {
    return _empresasRepository.buscarEmpresas(termoBusca);
  }
}
