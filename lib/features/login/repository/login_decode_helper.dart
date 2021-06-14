import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/login/models/dados_invalidos_model.dart';
import 'package:empresas_flutter/features/login/models/usuario_model.dart';

class LoginDecodeHelper {
  Either<ApiResult, UsuarioModel> decodeLogin({required ApiResult result}) {
    try {
      if (result is Success) {
        final uuid = result.responseHeaders["uid"];
        final client = result.responseHeaders["client"];
        final accessToken = result.responseHeaders["access-token"];
        final usuarioModel = UsuarioModel.fromJson(result.data);

        usuarioModel.setAccessData(
          uuid,
          accessToken,
          client,
        );

        return Right(usuarioModel);
      }

      if (result is Failure) {
        final dadosInvalidos = DadosInvalidosModel.fromJson(result.data);
        result.data = dadosInvalidos.toJson();
      }

      return Left(result);
    } catch (e) {
      result.message = Strings.erroAoDecodificar('LoginDecodeHelper');
      return Left(result);
    }
  }
}
