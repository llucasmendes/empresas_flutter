import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/widgets/error_widgets/generic_error_widget.dart';

class SemInternetWidget extends GenericErrorWidget {
  final Function aoApertarTentarNovamente;
  final Color corTexto;
  final Color corIcone;

  const SemInternetWidget({
    Key? key,
    required this.aoApertarTentarNovamente,
    required this.corTexto,
    required this.corIcone,
  }) : super(
          key: key,
          aoApertarTentarNovamente: aoApertarTentarNovamente,
          semanticText: Strings.dispositivoSemInternet,
          corIcone: corIcone,
          corTexto: corTexto,
          iconeErro: Icons.perm_scan_wifi_outlined,
          textoBotao: Strings.tentarNovamente,
          textoExplicativo: Strings.naoConseguimosVerificarInternet,
          textoPrincipal: Strings.offline,
        );
}
