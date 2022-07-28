import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Âncora - Artes em Resina',
      theme: ThemeData(
        primarySwatch: CustomColors.customBlueDark,
        scaffoldBackgroundColor: CustomColors.customBlueMedium.shade600,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
