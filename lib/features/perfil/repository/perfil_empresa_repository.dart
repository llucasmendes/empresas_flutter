import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/perfil/datasource/perfil_empresa_datasource.dart';
import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';
import 'package:empresas_flutter/features/perfil/repository/perfil_empresa_decode_helper.dart';

class PerfilEmpresaRepository {
  PerfilEmpresaRepository({
    required IPerfilEmpresaDataSource dataSource,
    required PerfilEmpresaDecodeHelper decodeHelper,
  })  : _decodeHelper = decodeHelper,
        _dataSource = dataSource;

  final IPerfilEmpresaDataSource _dataSource;
  final PerfilEmpresaDecodeHelper _decodeHelper;

  Future<Either<ApiResult, PerfilEmpresaModel>> buscarById(
    int enterpriseId,
  ) async {
    final result = await this._dataSource.buscarById(enterpriseId);
    return _decodeHelper.decodeEmpresas(result: result);
  }
}
