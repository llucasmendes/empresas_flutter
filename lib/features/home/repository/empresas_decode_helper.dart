import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';

class EmpresasDecodeHelper {
  Either<ApiResult, EmpresasModel> decodeEmpresas({required ApiResult result}) {
    try {
      if (result is Success) {
        final empresas = EmpresasModel.fromJson(result.data);
        return Right(empresas);
      }

      return Left(result);
    } catch (e) {
      result.message = Strings.erroAoDecodificar('EmpresasDecodeHelper');
      return Left(result);
    }
  }
}
