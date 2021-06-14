import 'dart:async';

import 'package:empresas_flutter/features/home/screen/bloc/home_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empresas_flutter/configs/utils/UnauthorizesMixin.dart';

import 'package:empresas_flutter/features/home/usecases/buscar_empresas_usecase.dart';

class HomeScreenCubit extends Cubit<HomeState> with UnauthorizedMixin {
  late final BuscarEmpresasUseCase _buscarEmpresasUseCase;
  late final Timer _debounce;
  HomeScreenCubit({
    required BuscarEmpresasUseCase buscarEmpresasUseCase,
  })  : _buscarEmpresasUseCase = buscarEmpresasUseCase,
        super(
          HomeInicialState(),
        );

  late String _ultimoTermoBuscado;

  Future<void> _buscarEmpresas(
    String termoBusca, {
    bool erroAoBuscar = false,
  }) async {
    if (_ultimoTermoBuscado == termoBusca && !erroAoBuscar) return;
    _ultimoTermoBuscado = termoBusca;

    emit(LoadingState());

    final result = await _buscarEmpresasUseCase(termoBusca);

    result.fold((error) {
      if (error.statusCode == 401) {
        redirecionarLogin();
      }

      if (error.statusCode == null) {
        return emit(NoInternet());
      }
      emit(ApiReturnError());
    }, (empresas) {
      return emit(DadosCarregadosState(empresasModel: empresas));
    });
  }

  Future<void> buscarEmpresas(
      {String? termoBusca, required bool erroAoBuscar}) async {
    _iniciarDebounce(
      callback: () => _buscarEmpresas(
        termoBusca!.trim(),
        erroAoBuscar: erroAoBuscar,
      ),
    );
  }

  void _iniciarDebounce({required Function callback}) {
    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(Duration(milliseconds: 700), () async {
      callback();
    });
  }

  @override
  Future<void> close() {
    _debounce.cancel();
    _debounce = Timer(Duration(), () {});
    return super.close();
  }
}
