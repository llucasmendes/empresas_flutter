import 'package:flutter/foundation.dart';
import 'package:seafarer/seafarer.dart';

import '../routes.dart';
import 'app_routes.dart';
import 'i_app_navigator.dart';

class AppNavigator implements IAppNavigator {
  @override
  irParaHome({bool podeVoltar = false}) {
    Routes.sailor.navigate(
      AppRoutes.home,
      navigationType:
          podeVoltar ? NavigationType.push : NavigationType.popAndPushNamed,
    );
  }

  @override
  irParaLogin({bool podeVoltar = false}) {
    Routes.sailor.navigate(
      AppRoutes.login,
      navigationType:
          podeVoltar ? NavigationType.push : NavigationType.popAndPushNamed,
    );
  }

  @override
  irParaPerfil({bool podeVoltar = true, required int enterpriseId}) {
    Routes.sailor.navigate(
      AppRoutes.perfil,
      navigationType:
          podeVoltar ? NavigationType.push : NavigationType.popAndPushNamed,
      params: {
        'enterprise_id': enterpriseId,
      },
    );
  }
}
