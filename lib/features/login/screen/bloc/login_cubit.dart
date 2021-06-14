import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empresas_flutter/configs/utils/Validadores.dart';
import 'package:empresas_flutter/features/login/usecases/gravar_cabecalhos_local_usecase.dart';
import 'package:empresas_flutter/features/login/usecases/realizar_login_usecase.dart';

part 'login_state.dart';

class LoginScreenCubit extends Cubit<LoginState> {
  final RealizarLoginUseCase _realizarLoginUseCase;
  final GravarCabecalhosLocalLoginUseCase _gravarCabecalhosLocalLoginUseCase;
  final ValidadorEmail _validadorEmail;
  final ValidadorTamanho _validadorTamanho;

  LoginScreenCubit({
    required GravarCabecalhosLocalLoginUseCase
        gravarCabecalhosLocalLoginUseCase,
    required RealizarLoginUseCase realizarLoginUseCase,
    required ValidadorEmail validadorEmail,
    required ValidadorTamanho validadorTamanho,
  })  : _gravarCabecalhosLocalLoginUseCase = gravarCabecalhosLocalLoginUseCase,
        _realizarLoginUseCase = realizarLoginUseCase,
        _validadorEmail = validadorEmail,
        _validadorTamanho = validadorTamanho,
        super(
          LoginInicialState(),
        );

  bool _validarLogin(String email) =>
      _validadorEmail.isTextoValido(texto: email);

  bool _validarSenha(String senha) =>
      _validadorTamanho.isTextoValido(texto: senha);

  void validarDados(String email, String senha) {
    final loginValido = _validarLogin(email);
    final senhaValida = _validarSenha(senha);

    if (loginValido && senhaValida) {
      emit(DadosValidoState());
    } else {
      emit(DadosInvalidoState());
    }
  }

  void realizarLogin(String email, String password) async {
    emit(LoadingState());
    final result = await _realizarLoginUseCase(email, password);

    result.fold((error) {
      if (error.statusCode == null) {
        return emit(ApiReturnNoInternet());
      }
      emit(CredenciaisInvalidasState(
        mensagem: error.message,
      ));
    }, (usuario) {
      _gravarCabecalhosLocalLoginUseCase(
        usuario.uid as String,
        usuario.client as String,
        usuario.accessToken as String,
      );
      return emit(CredenciaisValidasState());
    });
  }
}
