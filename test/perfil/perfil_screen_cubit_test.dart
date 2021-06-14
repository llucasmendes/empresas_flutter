import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';

import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';
import 'package:empresas_flutter/features/perfil/screens/bloc/perfil_empresa_cubit.dart';
import 'package:empresas_flutter/features/perfil/usecases/perfil_empresa_usecase.dart';

class MockUseCase extends Mock implements PerfilEmpresaUseCase {}

void main() {
  MockUseCase mockUseCase = MockUseCase();
  PerfilEmpresaCubit perfilEmpresaCubit = PerfilEmpresaCubit(
    perfilEmpresaUseCase: mockUseCase,
  );

  PerfilEmpresaModel tperfilEmpresaModel = PerfilEmpresaModel(
      enterprise: Enterprise(
        enterpriseName: '',
      ),
      success: true);

  setUp(() {});

  tearDown(
    () => perfilEmpresaCubit.close(),
  );

  group('Cubit Perfil Screen: ', () {
    test(
      'Verificar estado inicial',
      () {
        expect(
          perfilEmpresaCubit.state,
          PerfilEmpresaInicialState(),
        );
      },
    );

    blocTest<PerfilEmpresaCubit, PerfilEmpresaState>(
      'Sucesso - Buscar Dados',
      build: () {
        when(
          mockUseCase.call(1),
        ).thenAnswer(
          (_) async => Right(PerfilEmpresaModel(
              enterprise: Enterprise(enterpriseName: ''), success: true)),
        );
        return perfilEmpresaCubit;
      },
      act: (bloc) async => perfilEmpresaCubit.buscarById(1),
      expect: <PerfilEmpresaState>[
        LoadingState(),
        DadosCarregadosState(enterpriseModel: tperfilEmpresaModel),
      ] as dynamic,
    );

    blocTest<PerfilEmpresaCubit, PerfilEmpresaState>(
      'Falha - Buscar Dados',
      build: () {
        when(
          mockUseCase.call(1),
        ).thenAnswer(
          (_) async => Left(ApiError(statusCode: 400, data: {}, message: '')),
        );
        return perfilEmpresaCubit;
      },
      act: (bloc) async => perfilEmpresaCubit.buscarById(1),
      expect: <PerfilEmpresaState>[
        LoadingState(),
        ApiReturnError(),
      ] as dynamic,
    );

    blocTest<PerfilEmpresaCubit, PerfilEmpresaState>(
      'Falha - Sem internet',
      build: () {
        when(
          mockUseCase.call(1),
        ).thenAnswer(
          (_) async => Left(ApiError(statusCode: 1, data: {}, message: '')),
        );
        return perfilEmpresaCubit;
      },
      act: (bloc) async => perfilEmpresaCubit.buscarById(1),
      expect: <PerfilEmpresaState>[
        LoadingState(),
        ApiReturnNoInternet(),
      ] as dynamic,
    );
  });
}
