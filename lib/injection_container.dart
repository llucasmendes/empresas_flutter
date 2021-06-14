import 'package:get_it/get_it.dart';
import 'package:empresas_flutter/configs/client/check_connectivty.dart';
import 'package:empresas_flutter/configs/client/custom_dio.dart';
import 'package:empresas_flutter/configs/routes/app/i_app_navigator.dart';
import 'package:empresas_flutter/configs/routes/app/app_navigator.dart';
import 'package:empresas_flutter/configs/utils/LocalStorage.dart';
import 'package:empresas_flutter/configs/utils/RequestApiProvider.dart';
import 'package:empresas_flutter/features/home/injection_container.dart';
import 'package:empresas_flutter/features/login/injection_container.dart';
import 'package:empresas_flutter/features/login/repository/login_repository.dart';
import 'package:empresas_flutter/features/login/usecases/limpar_cabecalhos_usecase.dart';
import 'package:empresas_flutter/features/perfil/injection_container.dart';
import 'package:empresas_flutter/features/splash/injection_container.dart';

final dependencia = GetIt.instance;

Future<void> init() async {
  dependencia.registerFactory(
    () => LocalConnectivity(),
  );

  dependencia.registerFactory(
    () => CustomDio(),
  );

  dependencia.registerLazySingleton<ILocalStorage>(
    () => SharedPref(),
  );

  dependencia.registerFactory(
    () => RequestApiProvider(
      customDio: dependencia<CustomDio>(),
    ),
  );

  dependencia.registerSingleton<IAppNavigator>(
    AppNavigator(),
  );

  dependencia.registerLazySingleton<LimparCabecalhosLocalLoginUseCase>(
    () => LimparCabecalhosLocalLoginUseCase(
      loginRepository: dependencia<LoginRepository>(),
    ),
  );

  HomeInjection()..injetar(dependencia);
  SplashInjection()..injetar(dependencia);
  LoginInjection()..injetar(dependencia);
  PerfilInjection()..injetar(dependencia);
}
