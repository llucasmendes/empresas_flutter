part of 'perfil_empresa_cubit.dart';

abstract class PerfilEmpresaState extends Equatable {
  const PerfilEmpresaState();
}

class PerfilEmpresaInicialState extends PerfilEmpresaState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PerfilEmpresaState {
  @override
  List<Object> get props => [];
}

class DadosCarregadosState extends PerfilEmpresaState {
  final PerfilEmpresaModel enterpriseModel;

  DadosCarregadosState({required this.enterpriseModel});

  @override
  List<Object> get props => [EmpresasModel];
}

class ApiReturnNoInternet extends PerfilEmpresaState {
  @override
  List<Object> get props => [];
}

class ApiReturnError extends PerfilEmpresaState {
  @override
  List<Object> get props => [];
}
