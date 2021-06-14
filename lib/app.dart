import 'package:flutter/material.dart';
import 'package:seafarer/seafarer.dart';
import 'package:empresas_flutter/configs/routes/routes.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';
import 'package:empresas_flutter/features/splash/screens/splash_screen.dart';

class IoasysSelecao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ioasys',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Fontes.montserrat,
      ),
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      navigatorObservers: [
        SeafarerLoggingObserver(),
        Routes.sailor.navigationStackObserver,
      ],
      home: Scaffold(
        body: SplashScreen(),
        backgroundColor: Cores.cinza[50],
      ),
    );
  }
}
