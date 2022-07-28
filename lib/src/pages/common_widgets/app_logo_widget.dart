import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {

  final double widthLogo;

  const AppLogoWidget({
    Key? key,
    this.widthLogo = 306,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logos/logoAncoraResina.png',
      width: widthLogo,
    );
  }
}
