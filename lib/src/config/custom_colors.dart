import 'package:flutter/material.dart';

Map<int, Color> _blueDarkOpacity = {
  50: const Color.fromRGBO(9, 9, 61, 0.1),
  100: const Color.fromRGBO(9, 9, 61, 0.2),
  200: const Color.fromRGBO(9, 9, 61, 0.3),
  300: const Color.fromRGBO(9, 9, 61, 0.4),
  400: const Color.fromRGBO(9, 9, 61, 0.5),
  500: const Color.fromRGBO(9, 9, 61, 0.6),
  600: const Color.fromRGBO(9, 9, 61, 0.7),
  700: const Color.fromRGBO(9, 9, 61, 0.8),
  800: const Color.fromRGBO(9, 9, 61, 0.9),
  900: const Color.fromRGBO(9, 9, 61, 1),
};

Map<int, Color> _blueLightOpacity = {
  50: const Color.fromRGBO(72, 75, 232, 0.1),
  100: const Color.fromRGBO(72, 75, 232, 0.2),
  200: const Color.fromRGBO(72, 75, 232, 0.3),
  300: const Color.fromRGBO(72, 75, 232, 0.4),
  400: const Color.fromRGBO(72, 75, 232, 0.5),
  500: const Color.fromRGBO(72, 75, 232, 0.6),
  600: const Color.fromRGBO(72, 75, 232, 0.7),
  700: const Color.fromRGBO(72, 75, 232, 0.8),
  800: const Color.fromRGBO(72, 75, 232, 0.9),
  900: const Color.fromRGBO(72, 75, 232, 1),
};

Map<int, Color> _blueMediumOpacity = {
  50: const Color.fromRGBO(12, 15, 196, 0.1),
  100: const Color.fromRGBO(12, 15, 196, 0.2),
  200: const Color.fromRGBO(12, 15, 196, 0.3),
  300: const Color.fromRGBO(12, 15, 196, 0.4),
  400: const Color.fromRGBO(12, 15, 196, 0.5),
  500: const Color.fromRGBO(12, 15, 196, 0.6),
  600: const Color.fromRGBO(12, 15, 196, 0.7),
  700: const Color.fromRGBO(12, 15, 196, 0.8),
  800: const Color.fromRGBO(12, 15, 196, 0.9),
  900: const Color.fromRGBO(12, 15, 196, 1),
};

abstract class CustomColors{
  // Background principal
  static MaterialColor customBlueDark = MaterialColor(0xFF09093d, _blueDarkOpacity);
  // Background formulário e texto Âncora
  static MaterialColor customBlueLight = MaterialColor(0xFF484be8, _blueLightOpacity);
  // Textos: Artes em Resina e Esqueceu a senha?
  static MaterialColor customBlueMedium = MaterialColor(0xFF0c0fc4, _blueMediumOpacity);
}


