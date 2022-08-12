import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/common_widgets/app_logo_widget.dart';
import 'package:ancora_artes/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      /* Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (c) {
          return const SignInScreen();
        }),
      ); */
      Get.offNamed(PagesRoutes.signInRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.customBlueMedium.shade500,
            CustomColors.customBlueMedium.shade50,
            CustomColors.customBlueMedium.shade500,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogoWidget(),
          CircularProgressIndicator(
            color: CustomColors.customBlueLight,
          ),
        ],
      ),
    );
  }
}
