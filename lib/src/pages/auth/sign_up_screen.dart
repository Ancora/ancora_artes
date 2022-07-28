import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/common_widgets/custom_text_field.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // Máscaras
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customBlueDark,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width, // opcional neste caso
          child: Stack(
            children: [
              Column(
                children: [
                  // Área do nome e animação
                  Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nome do app
                      Image.asset('assets/logos/logoAncoraResina.png'),
                      /* Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                          children: [
                            TextSpan(
                              text: 'Âncora ',
                              style: TextStyle(
                                color: CustomColors.customBlueLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Artes em resina',
                              style: TextStyle(
                                color: CustomColors.customBlueMedium,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ), */

                      // Animação da seção
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          ),
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Cadastro'),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // E-mail
                        const CustomTextField(
                          icon: Icons.email_outlined,
                          label: 'E-mail',
                        ),

                        // Senha
                        const CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Senha',
                          isSecret: true,
                        ),

                        // Nome
                        const CustomTextField(
                          icon: Icons.person_outline,
                          label: 'Nome',
                        ),

                        // Celular
                        CustomTextField(
                          icon: Icons.phone_android_outlined,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                        ),

                        // CPF
                        CustomTextField(
                          icon: Icons.aspect_ratio_outlined,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),

                        // Botão para acesso
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar Usuário',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Botão para voltar à tela de login
              Positioned(
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: CustomColors.customBlueLight,
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
