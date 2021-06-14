import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empresas_flutter/configs/routes/app/i_app_navigator.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';
import 'package:empresas_flutter/features/splash/screens/bloc/splash_cubit.dart';
import 'package:empresas_flutter/injection_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _irParaHome() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      dependencia<IAppNavigator>().irParaHome(podeVoltar: false);
    });
  }

  _irParaLogin() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      dependencia<IAppNavigator>().irParaLogin(podeVoltar: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => dependencia<SplashCubit>()..buscarDadosCabecalhos(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (_, state) {
          if (state is PossuiDadosGravados) {
            _irParaHome();
          }
          if (state is SemDadosGravados) {
            _irParaLogin();
          }
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  child: Image.asset(
                    IconesAplicacao.background,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(100.w),
                    child: Image.asset(
                      IconesAplicacao.logoHome,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
