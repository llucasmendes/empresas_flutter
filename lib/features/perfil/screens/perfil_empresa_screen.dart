import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafarer/seafarer.dart';

import 'package:empresas_flutter/configs/routes/routes.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';
import 'package:empresas_flutter/configs/utils/ValorMonetarioExtension.dart';
import 'package:empresas_flutter/features/perfil/model/perfil_empresa_model.dart';
import 'package:empresas_flutter/features/perfil/screens/bloc/perfil_empresa_cubit.dart';
import 'package:empresas_flutter/injection_container.dart';
import 'package:empresas_flutter/widgets/cached_image/cached_image.dart';
import 'package:empresas_flutter/widgets/custom_loading/custom_loading.dart';
import 'package:empresas_flutter/widgets/error_widgets/erro_api_widget.dart';
import 'package:empresas_flutter/widgets/error_widgets/sem_internet_widget.dart';

class PefilEmpresaScreen extends StatefulWidget {
  @override
  _PefilEmpresaScreenState createState() => _PefilEmpresaScreenState();
}

class _PefilEmpresaScreenState extends State<PefilEmpresaScreen> {
  late int empresaId;
  late PerfilEmpresaCubit cubit;

  _recarregar(BuildContext context) {
    BlocProvider.of<PerfilEmpresaCubit>(context).buscarById(empresaId);
  }

  _buscarDados(BuildContext context) {
    empresaId = Seafarer.param<int>(context, 'enterprise_id')!;
    cubit = dependencia<PerfilEmpresaCubit>();
    cubit.buscarById(empresaId);
  }

  _aoApertarVoltar() {
    Routes.sailor.pop();
  }

  @override
  Widget build(BuildContext context) {
    _buscarDados(context);
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<PerfilEmpresaCubit, PerfilEmpresaState>(
        builder: (context, state) {
          if (state is LoadingState) return CustomLoading();

          if (state is ApiReturnNoInternet)
            return SemInternetWidget(
              aoApertarTentarNovamente: () => _recarregar(context),
              corIcone: Colors.black,
              corTexto: Colors.black,
            );

          if (state is ApiReturnError)
            return ErroApiWidget(
              aoApertarTentarNovamente: () => _recarregar(context),
              corIcone: Colors.black,
              corTexto: Colors.black,
            );

          if (state is DadosCarregadosState)
            return _buildContent(context, state.enterpriseModel);

          return Container();
        },
      ),
    );
  }

  _buildContent(BuildContext context, PerfilEmpresaModel perfilEmpresaModel) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Cores.ruby,
        ),
        backgroundColor: Cores.cinza[50],
        elevation: 0,
        centerTitle: true,
        title: Text(
          perfilEmpresaModel.enterprise.enterpriseName,
          style: TextStyle(
            fontSize: 20.ssp,
            fontFamily: Fontes.montserrat,
            fontWeight: Fontes.semiBold,
            color: Cores.preto,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              child: CachedImage(
                imageUrl:
                    'https://empresas.ioasys.com.br/${perfilEmpresaModel.enterprise.photo}',
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.w),
              child: Text(
                '${perfilEmpresaModel.enterprise.enterpriseName}',
                style: TextStyle(
                  fontSize: 14.ssp,
                  fontFamily: Fontes.montserrat,
                  color: Cores.preto,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.w),
              child: Text(
                '${perfilEmpresaModel.enterprise.description}',
                style: TextStyle(
                  fontSize: 12.ssp,
                  fontFamily: Fontes.montserrat,
                  color: Cores.cinza[200],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            _buildItemList(
              Icon(Icons.monetization_on),
              '${perfilEmpresaModel.enterprise.sharePrice!.emReal}',
            ),
            _buildItemList(
              Icon(Icons.location_city_outlined),
              '${perfilEmpresaModel.enterprise.city}-${perfilEmpresaModel.enterprise.country}',
            ),
            _buildItemList(
              Icon(Icons.phone),
              '${perfilEmpresaModel.enterprise.phone}',
            ),
            _buildItemList(
              _buildImmageIcon(
                IconesAplicacao.iconeFaceBook,
                Cores.preto,
              ),
              '${perfilEmpresaModel.enterprise.facebook}',
            ),
            _buildItemList(
              _buildImmageIcon(
                IconesAplicacao.iconeTwitter,
                Cores.preto,
              ),
              '${perfilEmpresaModel.enterprise.twitter}',
            ),
            _buildItemList(
              _buildImmageIcon(
                IconesAplicacao.iconeEmail,
                Cores.preto,
              ),
              '${perfilEmpresaModel.enterprise.emailEnterprise}',
            ),
          ],
        ),
      ),
    );
  }

  _buildImmageIcon(String imagem, Color cor) {
    return Container(
      height: 16.h,
      child: Image.asset(
        imagem,
        color: cor,
      ),
    );
  }

  _buildItemList(Widget icone, String texto) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Row(
        children: [
          Container(
            child: icone,
          ),
          Container(
            padding: EdgeInsets.all(12.w),
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 14.ssp,
                fontFamily: Fontes.montserrat,
                color: Cores.preto,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
