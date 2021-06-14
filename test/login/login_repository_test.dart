import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';
import 'package:empresas_flutter/features/login/datasource/login_datasource.dart';
import 'package:empresas_flutter/features/login/models/cabecalho_model.dart';
import 'package:empresas_flutter/features/login/models/usuario_model.dart';
import 'package:empresas_flutter/features/login/repository/login_decode_helper.dart';
import 'package:empresas_flutter/features/login/repository/login_repository.dart';

class MockDatasource extends Mock implements ILoginDataSource {}

class MockDecodeHelper extends Mock implements LoginDecodeHelper {}

void main() {
  MockDatasource mockDataSource = MockDatasource();
  MockDecodeHelper mockDecodeHelper = MockDecodeHelper();
  LoginRepository loginRepository = LoginRepository(
    loginDataSource: mockDataSource,
    loginDecodeHelper: mockDecodeHelper,
  );

  setUp(() {});

  group('Login repository:', () {
    final tRetornoErro = ApiError(
      message: 'Erro na api',
      statusCode: 400,
      data: {},
    );

    final tRetornoSucesso =
        Success(dataList: [], statusCode: 200, data: {}, responseHeaders: {});

    final tRetornoCabecalho = '';

    UsuarioModel usuarioModel = UsuarioModel();
    test(
      'Sucesso - Deve realizar login',
      () async {
        when(mockDataSource.realizarLogin(body: anyNamed('body') as dynamic))
            .thenAnswer((_) async => tRetornoSucesso);

        when(mockDecodeHelper.decodeLogin(
                result: anyNamed('result') as dynamic))
            .thenAnswer((_) => Right(usuarioModel));

        final result = await loginRepository.realizarLogin('any', 'any');
        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r), isA<UsuarioModel>());
        verify(mockDataSource.realizarLogin(body: anyNamed('body') as dynamic))
            .called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'Falha - Erro ao realizar login',
      () async {
        when(mockDataSource.realizarLogin(body: anyNamed('body') as dynamic))
            .thenAnswer((_) async => tRetornoErro);

        when(mockDecodeHelper.decodeLogin(result: tRetornoErro))
            .thenAnswer((_) => Left(tRetornoErro));

        final result = await loginRepository.realizarLogin('any', 'any');

        expect(result, isA<Left>());
        expect(
          result,
          Left<ApiResult, EmpresasModel>(tRetornoErro),
        );
        verify(mockDataSource.realizarLogin(body: anyNamed('body') as dynamic))
            .called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'Sucesso - Buscar Cabecalhos',
      () async {
        when(mockDataSource.buscarCabecalhoLocal('any'))
            .thenAnswer((_) async => tRetornoCabecalho);

        final result = await loginRepository.buscarCabecalhosLocal();

        expect(result, isA<CabecalhoModel>());
      },
    );
  });
}
