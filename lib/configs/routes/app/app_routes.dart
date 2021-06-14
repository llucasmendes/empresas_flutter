import 'package:flutter/material.dart';

import 'package:seafarer/seafarer.dart';
import 'package:empresas_flutter/features/home/screen/home_screen.dart';
import 'package:empresas_flutter/features/login/screen/login_screen.dart';
import 'package:empresas_flutter/features/perfil/screens/perfil_empresa_screen.dart';
import 'package:empresas_flutter/features/splash/screens/splash_screen.dart';

abstract class AppRoutes {
  static final splashScreen = '/splash';
  static final home = '/home';
  static final login = '/login';
  static final perfil = '/perfil';

  static getRoutes() {
    return [
      SeafarerRoute(
        name: AppRoutes.splashScreen,
        builder: (context, args, params) => Scaffold(body: SplashScreen()),
        defaultTransitions: [
          SeafarerTransition.slide_from_right,
        ],
      ),
      SeafarerRoute(
        name: AppRoutes.login,
        builder: (context, args, params) => Scaffold(body: LoginScreen()),
        defaultTransitions: [
          SeafarerTransition.slide_from_right,
        ],
      ),
      SeafarerRoute(
        name: AppRoutes.home,
        builder: (context, args, params) => Scaffold(body: HomeScreen()),
        defaultTransitions: [
          SeafarerTransition.slide_from_right,
        ],
      ),
      SeafarerRoute(
        name: AppRoutes.perfil,
        params: [
          SeafarerParam<int>(
            name: 'enterprise_id',
          ),
        ],
        builder: (context, args, params) =>
            Scaffold(body: PefilEmpresaScreen()),
        defaultTransitions: [
          SeafarerTransition.slide_from_right,
        ],
      )
    ];
  }
}
