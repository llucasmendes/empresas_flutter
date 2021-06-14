import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';
import 'package:empresas_flutter/features/perfil/repository/perfil_empresa_repository.dart';

class PerfilEmpresaUseCase {
  PerfilEmpresaRepository _perfilEmpresaRepository;
  PerfilEmpresaUseCase(
      {required PerfilEmpresaRepository perfilEmpresaRepository})
      : _perfilEmpresaRepository = perfilEmpresaRepository;

  Future<Either<ApiResult, PerfilEmpresaModel>> call(int empresaId) async {
    return _perfilEmpresaRepository.buscarById(empresaId);
  }
}
