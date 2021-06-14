import 'package:get_it/get_it.dart';
import 'package:teste_selecao/configs/client/check_connectivty.dart';
import 'package:teste_selecao/configs/client/custom_dio.dart';
import 'package:teste_selecao/configs/routes/app/i_app_navigator.dart';
import 'package:teste_selecao/configs/routes/app/app_navigator.dart';
import 'package:teste_selecao/configs/utils/LocalStorage.dart';
import 'package:teste_selecao/configs/utils/RequestApiProvider.dart';
import 'package:teste_selecao/features/home/injection_container.dart';
import 'package:teste_selecao/features/login/injection_container.dart';
import 'package:teste_selecao/features/login/repository/login_repository.dart';
import 'package:teste_selecao/features/login/usecases/limpar_cabecalhos_usecase.dart';
import 'package:teste_selecao/features/perfil/injection_container.dart';
import 'package:teste_selecao/features/splash/injection_container.dart';

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
