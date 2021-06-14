import 'package:get_it/get_it.dart';
import 'package:empresas_flutter/configs/utils/RequestApiProvider.dart';
import 'package:empresas_flutter/features/home/datasource/empresas_datasource.dart';
import 'package:empresas_flutter/features/home/repository/empresas_decode_helper.dart';
import 'package:empresas_flutter/features/home/repository/empresas_repository.dart';
import 'package:empresas_flutter/features/home/screen/bloc/home_cubit.dart';
import 'package:empresas_flutter/features/home/usecases/buscar_empresas_usecase.dart';

class HomeInjection {
  void injetar(GetIt dependencia) {
    dependencia.registerLazySingleton<IEmpresasDataSource>(
      () => EmpresasDataSource(
        apiProvider: dependencia<RequestApiProvider>(),
      ),
    );

    dependencia.registerLazySingleton(
      () => EmpresasDecodeHelper(),
    );

    dependencia.registerLazySingleton(
      () => EmpresasRepository(
        empresasDataSource: dependencia<IEmpresasDataSource>(),
        empresasDecodeHelper: dependencia<EmpresasDecodeHelper>(),
      ),
    );

    dependencia.registerLazySingleton<BuscarEmpresasUseCase>(
      () => BuscarEmpresasUseCase(
        empresasRepository: dependencia<EmpresasRepository>(),
      ),
    );

    dependencia.registerFactory(
      () => HomeScreenCubit(
        buscarEmpresasUseCase: dependencia<BuscarEmpresasUseCase>(),
      ),
    );
  }
}
