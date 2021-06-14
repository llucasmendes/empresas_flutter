import 'package:get_it/get_it.dart';

import 'package:empresas_flutter/features/login/repository/login_repository.dart';
import 'package:empresas_flutter/features/splash/screens/bloc/splash_cubit.dart';
import 'package:empresas_flutter/features/splash/usecases/buscar_cabecalhos_local_usecase.dart';

class SplashInjection {
  void injetar(GetIt dependencia) {
    dependencia.registerLazySingleton<BuscarCabecalhosLocalLoginUseCase>(
      () => BuscarCabecalhosLocalLoginUseCase(
        loginRepository: dependencia<LoginRepository>(),
      ),
    );

    dependencia.registerFactory(
      () => SplashCubit(
        buscarCabecalhosLocalLoginUseCase:
            dependencia<BuscarCabecalhosLocalLoginUseCase>(),
      ),
    );
  }
}
