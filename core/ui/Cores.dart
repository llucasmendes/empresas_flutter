import 'package:flutter/material.dart';

abstract class Cores {
  static final transparente = const Color(0x00000000);
  static final preto = const Color(0xFF000000);
  static final ruby = const Color(0xFFE01E69);
  static final claro = const Color(0xFFF2F2F2);
  static final branco = Color(0xFFFFFFFF);
  static final vermelhorErro = Color(0xFFE00000);

  static final magicMint = Color(0xFFA6F0C6);
  static final moonRaker = Color(0xFFe5d2f7);
  static final feijoa = Color(0xFF98d689);
  static final purpleHeart = Color(0xFF5c2dc4);
  static final blizzardBlue = Color(0xFF9cebec);
  static final havelockBlue = Color(0xFF4e96d5);
  static final teaGeen = Color(0xFFc7f0c4);
  static final royalBlue = Color(0xFF5870e8);
  static final mantis = Color(0xFF79c473);
  static final paris = Color(0xFF200572);
  static final sun = Color(0xFFf58634);
  static final allPort = Color(0xFF11698e);

  static const MaterialColor cinza = MaterialColor(
    0xFFF3F3F3,
    <int, Color>{
      50: Color(0xFFF5F5F5),
      100: Color(0xFFE5E5E5),
      200: Color(0xFFA1A1A1),
    },
  );
}
