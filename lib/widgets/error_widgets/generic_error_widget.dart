import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';
import 'package:empresas_flutter/widgets/botao_principal/botao_principal.dart';

class GenericErrorWidget extends StatelessWidget {
  final Function aoApertarTentarNovamente;
  final String textoPrincipal;
  final String textoExplicativo;
  final String semanticText;
  final String textoBotao;
  final Color? corTexto;
  final IconData iconeErro;
  final Color? corIcone;

  const GenericErrorWidget({
    Key? key,
    required this.aoApertarTentarNovamente,
    required this.textoPrincipal,
    required this.textoExplicativo,
    required this.semanticText,
    required this.textoBotao,
    required this.corTexto,
    required this.iconeErro,
    required this.corIcone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 100.h,
            ),
            width: 50.w,
            height: 50.h,
            child: Icon(
              iconeErro,
              color: corIcone,
              size: 48.h,
              semanticLabel: semanticText,
            ),
          ),
          Container(
            width: 350.w,
            margin: EdgeInsets.only(
              top: 40.h,
              bottom: 30.h,
            ),
            child: Text(
              textoPrincipal,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.ssp,
                color: corTexto ?? Cores.preto,
                fontFamily: Fontes.montserrat,
                fontWeight: Fontes.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 45.h,
            ),
            width: 320.w,
            child: Text(
              textoExplicativo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.ssp,
                color: corTexto,
                fontFamily: Fontes.montserrat,
                fontWeight: Fontes.normal,
              ),
            ),
          ),
          BotaoPrincipal(
            texto: textoBotao,
            corTexto: Cores.preto,
            aoClicar: aoApertarTentarNovamente,
            altura: 55.h,
            largura: 266.w,
          )
        ],
      ),
    );
  }
}
