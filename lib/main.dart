import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empresas_flutter/app.dart';
import 'package:empresas_flutter/configs/routes/routes.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  Routes.createRoutes();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Cores.preto),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(IoasysSelecao());
}
