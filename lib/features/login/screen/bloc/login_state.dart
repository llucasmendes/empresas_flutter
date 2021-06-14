part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInicialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class DadosInvalidoState extends LoginState {
  @override
  List<Object> get props => [];
}

class DadosValidoState extends LoginState {
  @override
  List<Object> get props => [];
}

class CredenciaisInvalidasState extends LoginState {
  final String mensagem;
  CredenciaisInvalidasState({required this.mensagem});
  @override
  List<Object> get props => [mensagem];
}

class CredenciaisValidasState extends LoginState {
  @override
  List<Object> get props => [];
}

class ApiReturnNoInternet extends LoginState {
  @override
  List<Object> get props => [];
}

class ApiReturnError extends LoginState {
  @override
  List<Object> get props => [];
}
