import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/widgets/error_widgets/generic_error_widget.dart';

class ErroApiWidget extends GenericErrorWidget {
  final Function aoApertarTentarNovamente;
  final Color corTexto;
  final Color corIcone;

  const ErroApiWidget({
    Key? key,
    required this.aoApertarTentarNovamente,
    required this.corTexto,
    required this.corIcone,
  }) : super(
          aoApertarTentarNovamente: aoApertarTentarNovamente,
          semanticText: Strings.problemasComServidor,
          corIcone: corIcone,
          corTexto: corTexto,
          iconeErro: Icons.error,
          textoBotao: Strings.tentarNovamente,
          textoExplicativo: Strings.desculpe,
          textoPrincipal: Strings.tenteMaisTarde,
        );
}
