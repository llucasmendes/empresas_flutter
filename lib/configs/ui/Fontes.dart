import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fontes {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight ultraBold = extraBold;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight black = FontWeight.w900;
  static const FontWeight normal = FontWeight.w400;

  static const String montserrat = 'Montserrat';

  static double fatorDeEscalaDeTextoPara(BuildContext context) {
    final double fatorEscalaSistema = MediaQuery.textScaleFactorOf(context);
    final double fatorEscala =
        fatorEscalaSistema <= 1.67 ? fatorEscalaSistema : 1.67;
    return fatorEscala;
  }

  static bool isEscalaTextoMaiorQuePadrao(BuildContext context) {
    return MediaQuery.textScaleFactorOf(context) > 1;
  }
}
