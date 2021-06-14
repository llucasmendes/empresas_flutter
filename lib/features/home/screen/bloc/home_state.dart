part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInicialState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class DadosCarregadosState extends HomeState {
  final EmpresasModel empresasModel;

  DadosCarregadosState({required this.empresasModel});

  @override
  List<Object> get props => [EmpresasModel];
}

class NoInternet extends HomeState {
  @override
  List<Object> get props => [];
}

class ApiReturnError extends HomeState {
  @override
  List<Object> get props => [];
}
