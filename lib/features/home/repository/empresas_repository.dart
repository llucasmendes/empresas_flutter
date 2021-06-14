import 'package:dartz/dartz.dart';

import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/home/datasource/empresas_datasource.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';
import 'package:empresas_flutter/features/home/repository/empresas_decode_helper.dart';

class EmpresasRepository {
  EmpresasRepository({
    required IEmpresasDataSource empresasDataSource,
    required EmpresasDecodeHelper empresasDecodeHelper,
  })  : _decodeHelper = empresasDecodeHelper,
        _dataSource = empresasDataSource;

  final IEmpresasDataSource _dataSource;
  final EmpresasDecodeHelper _decodeHelper;

  Future<Either<ApiResult, EmpresasModel>> buscarEmpresas(
    String termoBusca,
  ) async {
    final result = await this._dataSource.buscarEmpresas(termoBusca);
    return _decodeHelper.decodeEmpresas(result: result);
  }
}
