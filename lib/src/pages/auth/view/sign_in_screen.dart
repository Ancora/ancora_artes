import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/auth/controller/auth_controller.dart';
import 'package:ancora_artes/src/pages/common_widgets/app_logo_widget.dart';
import 'package:ancora_artes/src/pages/common_widgets/custom_text_field.dart';
import 'package:ancora_artes/src/pages_routes/app_pages.dart';
import 'package:ancora_artes/src/services/validators.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  /* Controladores de campos de texto */
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customBlueDark,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width, // opcional neste caso
          child: Column(
            children: [
              // Área do nome e animação
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nome do app
                  const AppLogoWidget(),

                  // Animação das categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText('Relógios de Parede'),
                          FadeAnimatedText('Cinzeiros'),
                          FadeAnimatedText('Placas Comemorativas'),
                          FadeAnimatedText('Utilidades'),
                          FadeAnimatedText('Petisqueiras'),
                        ],
                      ),
                    ),
                  )
                ],
              )),

              // Área do formulário
              Container(
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.customBlueLight,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // E-mail
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email_outlined,
                        label: 'E-mail',
                        validator: emailValidator,
                      ),

                      // Senha
                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.lock_outline,
                        label: 'Senha',
                        isSecret: true,
                        validator: passwordValidator,
                      ),

                      // Botão para acesso
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      /* Minimizar o teclado */
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;
                                        authController.signIn(
                                          email: email,
                                          password: password,
                                        );
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      // Botão esqueceu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customBlueMedium,
                            ),
                          ),
                        ),
                      ),

                      // Linha de divisão
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.blueGrey.withAlpha(95),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                'Ou',
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.blueGrey.withAlpha(95),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Criar conta
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            /* Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) {
                                return SignUpScreen();
                              }),
                            ); */

                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Criar Conta',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
