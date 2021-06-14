import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/routes/app/i_app_navigator.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/features/home/models/enterprise_model.dart';
import 'package:empresas_flutter/injection_container.dart';
import 'package:empresas_flutter/widgets/cached_image/cached_image.dart';

enum TipoEmpresa {
  Software,
  IoT,
  Health,
  Education,
  Industry,
  Marketplace,
  Construction,
  Fintech,
  HR_Tech,
  Biotechnology,
  Games,
  Default
}

class ItemEmpresaFactory {
  Color _getTipoEmpresa(String tipoEmpresa) {
    switch (tipoEmpresa) {
      case 'Software':
        return _getColorType(TipoEmpresa.Software);
      case 'IoT':
        return _getColorType(TipoEmpresa.IoT);
      case 'Health':
        return _getColorType(TipoEmpresa.Health);
      case 'Education':
        return _getColorType(TipoEmpresa.Education);
      case 'Industry':
        return _getColorType(TipoEmpresa.Industry);
      case 'Marketplace':
        return _getColorType(TipoEmpresa.Marketplace);
      case 'Construction':
        return _getColorType(TipoEmpresa.Construction);
      case 'Fintech':
        return _getColorType(TipoEmpresa.Fintech);
      case 'HR Tech':
        return _getColorType(TipoEmpresa.HR_Tech);
      case 'Biotechnology':
        return _getColorType(TipoEmpresa.Biotechnology);
      case 'Games':
        return _getColorType(TipoEmpresa.Games);
      default:
        return _getColorType(TipoEmpresa.Default);
    }
  }

  Color _getColorType(TipoEmpresa tipoEmpresa) {
    switch (tipoEmpresa) {
      case TipoEmpresa.Software:
        return Cores.magicMint;
      case TipoEmpresa.IoT:
        return Cores.moonRaker;
      case TipoEmpresa.Health:
        return Cores.feijoa;
      case TipoEmpresa.Education:
        return Cores.purpleHeart;
      case TipoEmpresa.Industry:
        return Cores.blizzardBlue;
      case TipoEmpresa.Marketplace:
        return Cores.havelockBlue;
      case TipoEmpresa.Construction:
        return Cores.teaGeen;
      case TipoEmpresa.Fintech:
        return Cores.royalBlue;
      case TipoEmpresa.HR_Tech:
        return Cores.mantis;
      case TipoEmpresa.Biotechnology:
        return Cores.paris;
      case TipoEmpresa.Games:
        return Cores.allPort;
      default:
        return Cores.sun;
    }
  }

  _irParaPaginaEmpresa(int id) {
    dependencia<IAppNavigator>()
        .irParaPerfil(podeVoltar: true, enterpriseId: id);
  }

  Widget buildItemEnterprise(Enterprises enterprise) {
    return GestureDetector(
      onTap: () => _irParaPaginaEmpresa(enterprise.id),
      child: Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.all(12.w),
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _getTipoEmpresa(enterprise.enterpriseType.enterpriseTypeName),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: '${enterprise.photo}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  child: CachedImage(
                      imageUrl:
                          'https://empresas.ioasys.com.br/${enterprise.photo}'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 200.w,
                      child: Text(
                        '${enterprise.enterpriseName}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text('${enterprise.city} - ${enterprise.country}'),
                  Text(enterprise.enterpriseType.enterpriseTypeName),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildText(int totaisEncontrados) {
    return Container(
      margin: EdgeInsets.only(top: 36.h, left: 16.w),
      child: Text(
        Strings.totaisEncontrados(totaisEncontrados),
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14.ssp,
          fontFamily: Fontes.montserrat,
          color: Cores.cinza[200],
        ),
      ),
    );
  }

  Widget buildItens(List<Enterprises> enterprises) {
    List<Widget> lista = [_buildText(enterprises.length)];
    for (var enterprise in enterprises) {
      final widgetEnterprise = buildItemEnterprise(enterprise);
      lista.add(widgetEnterprise);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lista,
    );
  }
}
