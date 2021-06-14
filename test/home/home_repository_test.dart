import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/home/datasource/empresas_datasource.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';
import 'package:empresas_flutter/features/home/repository/empresas_decode_helper.dart';
import 'package:empresas_flutter/features/home/repository/empresas_repository.dart';

class MockDatasource extends Mock implements IEmpresasDataSource {}

class MockDecodeHelper extends Mock implements EmpresasDecodeHelper {}

void main() {
  MockDatasource mockDataSource = MockDatasource();
  MockDecodeHelper mockDecodeHelper = MockDecodeHelper();
  EmpresasRepository empresasRepository = EmpresasRepository(
    empresasDataSource: mockDataSource,
    empresasDecodeHelper: mockDecodeHelper,
  );
  ;

  setUp(() {});

  group('Home repository:', () {
    final tRetornoErro = ApiError(
      message: 'Erro na api',
      statusCode: 400,
      data: {},
    );

    final tRetornoSucesso =
        Success(dataList: [], statusCode: 200, data: {}, responseHeaders: {});
    EmpresasModel empresasModel = EmpresasModel(enterprises: []);
    test(
      'Sucesso - Deve retornar um EmpresasModel',
      () async {
        when(mockDataSource.buscarEmpresas('any'))
            .thenAnswer((_) async => tRetornoSucesso);

        when(mockDecodeHelper.decodeEmpresas(result: tRetornoSucesso))
            .thenAnswer((_) => Right(empresasModel));

        final result = await empresasRepository.buscarEmpresas('any');
        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r), isA<EmpresasModel>());
        verify(mockDataSource.buscarEmpresas('any')).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'Falha - Deve retornar erro da API quando houver falha',
      () async {
        when(mockDataSource.buscarEmpresas('any'))
            .thenAnswer((_) async => tRetornoErro);

        when(mockDecodeHelper.decodeEmpresas(result: tRetornoErro))
            .thenAnswer((_) => Left(tRetornoErro));

        final result = await empresasRepository.buscarEmpresas('any');

        expect(result, isA<Left>());
        expect(
          result,
          Left<ApiResult, EmpresasModel>(tRetornoErro),
        );
        verify(mockDataSource.buscarEmpresas('any')).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );
  });
}
