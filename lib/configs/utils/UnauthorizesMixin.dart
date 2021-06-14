import 'package:empresas_flutter/configs/routes/app/i_app_navigator.dart';
import 'package:empresas_flutter/features/login/usecases/limpar_cabecalhos_usecase.dart';
import 'package:empresas_flutter/injection_container.dart';

mixin UnauthorizedMixin {
  void redirecionarLogin() {
    final limparCabecalhosLocalLoginUseCase =
        dependencia<LimparCabecalhosLocalLoginUseCase>();
    limparCabecalhosLocalLoginUseCase.call();
    dependencia<IAppNavigator>().irParaLogin(podeVoltar: false);
  }
}
