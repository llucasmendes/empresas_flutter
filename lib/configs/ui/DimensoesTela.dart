import 'dart:math';

import 'package:flutter/material.dart';

abstract class DimensoesTela {
  static double get _alturaDesing => 667;

  static double get _larguraDesing => 375;

  static double get largura {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .size
        .width;
  }

  static double get altura {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .size
        .height;
  }

  static double get fatorEscalaTextoRealDispositivo {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .textScaleFactor;
  }

  static double get fatorEscalaTexto {
    return fatorEscalaTextoRealDispositivo <= 1.6
        ? fatorEscalaTextoRealDispositivo
        : 1.6;
  }

  static double get escalaLargura => largura / _larguraDesing;

  static double get escalaAltura => altura / _alturaDesing;

  static double get escalaTexto => escalaLargura;

  static double get alturaStatusBar =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top;

  static double get alturaBottomBar =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.bottom;

  static double get comprimentoMaximo {
    return max(altura, largura);
  }

  static double get comprimentoMinimo {
    return min(altura, largura);
  }

  static double alturaEscalonada(double alturaDesejada) {
    return alturaDesejada * escalaAltura;
  }

  static double larguraEscalonada(double larguraDesejada) {
    return larguraDesejada * escalaLargura;
  }

  static double setFonte(double tamanhoFonte, {bool autoScale = false}) {
    if (autoScale) {
      return tamanhoFonte *
          escalaTexto *
          fatorEscalaTexto /
          fatorEscalaTextoRealDispositivo;
    }
    return (tamanhoFonte * escalaTexto) / fatorEscalaTextoRealDispositivo;
  }

  static bool get isTelaPequena => largura <= 320;
  static bool get isTelaAchatada => altura <= 600 || largura <= 320;
}

extension DimensoesTelaExtension on num {
  double get h => DimensoesTela.alturaEscalonada(toDouble());
  double get w => DimensoesTela.larguraEscalonada(toDouble());
  double get sp => DimensoesTela.setFonte(toDouble());
  double get ssp => DimensoesTela.setFonte(toDouble(), autoScale: true);
}
