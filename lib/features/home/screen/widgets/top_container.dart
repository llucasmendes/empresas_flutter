import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';

class TopContainer extends StatelessWidget {
  final double alturaContainer;

  const TopContainer({
    Key? key,
    required this.alturaContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: alturaContainer,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IconesAplicacao.backgroundMini),
              fit: BoxFit.cover,
            ),
          ),
          duration: Duration(milliseconds: 500),
        ),
        Positioned(
          bottom: -20.h,
          child: Container(
            height: 94.h,
            child: Image.asset(IconesAplicacao.logoHome1),
          ),
        ),
        Positioned(
          top: 0.h,
          left: -20.w,
          child: Container(
            height: 200.h,
            child: Image.asset(IconesAplicacao.logoHome2),
          ),
        ),
        Positioned(
          bottom: -20.h,
          right: 50.w,
          child: Container(
            height: 100.h,
            child: Image.asset(IconesAplicacao.logoHome3),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 0.w,
          child: Container(
            height: 120.h,
            child: Image.asset(IconesAplicacao.logoHome4),
          ),
        )
      ],
    );
  }
}
