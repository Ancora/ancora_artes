import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/auth/controller/auth_controller.dart';
import 'package:ancora_artes/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  /* Trecho para iniciar o app somente se todos os plugins estiverem realmente inicializados */
  WidgetsFlutterBinding.ensureInitialized();

  /* Injetando o AuthController na memória */
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Âncora - Artes em Resina',
      theme: ThemeData(
        primarySwatch: CustomColors.customBlueDark,
        scaffoldBackgroundColor: CustomColors.customBlueMedium.shade600,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
