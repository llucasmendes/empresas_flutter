import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';

class PerfilEmpresaDecodeHelper {
  Either<ApiResult, PerfilEmpresaModel> decodeEmpresas({
    required ApiResult result,
  }) {
    try {
      if (result is Success) {
        final empresas = PerfilEmpresaModel.fromJson(result.data);
        return Right(empresas);
      }

      return Left(result);
    } catch (e) {
      result.message = Strings.erroAoDecodificar('EnterpriseByIdModel');
      return Left(result);
    }
  }
}
