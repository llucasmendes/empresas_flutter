import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresas_flutter/configs/utils/ApiResult.dart';
import 'package:empresas_flutter/features/perfil/datasource/perfil_empresa_datasource.dart';
import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';
import 'package:empresas_flutter/features/perfil/repository/perfil_empresa_decode_helper.dart';
import 'package:empresas_flutter/features/perfil/repository/perfil_empresa_repository.dart';

class MockDatasource extends Mock implements IPerfilEmpresaDataSource {}

class MockDecodeHelper extends Mock implements PerfilEmpresaDecodeHelper {}

void main() {
  MockDatasource mockDataSource = MockDatasource();
  MockDecodeHelper mockDecodeHelper = MockDecodeHelper();
  PerfilEmpresaRepository perfilEmpresaRepository = PerfilEmpresaRepository(
    dataSource: mockDataSource,
    decodeHelper: mockDecodeHelper,
  );

  setUp(() {});

  group('Perfil repository:', () {
    final tRetornoErro = ApiError(
      message: 'Erro na api',
      statusCode: 400,
      data: {},
    );

    final tRetornoSucesso =
        Success(dataList: [], statusCode: 200, data: {}, responseHeaders: {});

    final tNumber = 1;
    PerfilEmpresaModel perfilEmpresaModel = PerfilEmpresaModel(
      enterprise: Enterprise(enterpriseName: ""),
      success: true,
    );
    test(
      'Sucesso - Deve retornar um PerfilEmpresaModel',
      () async {
        when(mockDataSource.buscarById(tNumber))
            .thenAnswer((_) async => tRetornoSucesso);

        when(mockDecodeHelper.decodeEmpresas(result: tRetornoSucesso))
            .thenAnswer((_) => Right(perfilEmpresaModel));

        final result = await perfilEmpresaRepository.buscarById(tNumber);
        expect(result, isA<Right>());
        expect(result.fold((l) => l, (r) => r), isA<PerfilEmpresaModel>());
        verify(mockDataSource.buscarById(tNumber)).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'Falha - Deve retornar erro da API quando houver falha',
      () async {
        when(mockDataSource.buscarById(tNumber))
            .thenAnswer((_) async => tRetornoErro);

        when(mockDecodeHelper.decodeEmpresas(result: tRetornoErro))
            .thenAnswer((_) => Left(tRetornoErro));

        final result = await perfilEmpresaRepository.buscarById(tNumber);

        expect(result, isA<Left>());
        expect(
          result,
          Left<ApiResult, PerfilEmpresaModel>(tRetornoErro),
        );
        verify(mockDataSource.buscarById(tNumber)).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );
  });
}
