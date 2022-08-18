import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/auth/controller/auth_controller.dart';
import 'package:ancora_artes/src/pages/common_widgets/app_logo_widget.dart';
import 'package:ancora_artes/src/pages/common_widgets/custom_text_field.dart';
import 'package:ancora_artes/src/services/validators.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // Key do formulário
  final _formKey = GlobalKey<FormState>();

  // Objeto para enviar os dados do novo cadastro
  final authController = Get.find<AuthController>();

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
                      const AppLogoWidget(),
                      // Animação da seção
                      SizedBox(
                        height: 20,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // E-mail
                          CustomTextField(
                            icon: Icons.email_outlined,
                            label: 'E-mail',
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator,
                            onSaved: (value) {
                              authController.user.email = value;
                            },
                          ),

                          // Senha
                          CustomTextField(
                            icon: Icons.lock_outline,
                            label: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                            onSaved: (value) {
                              authController.user.password = value;
                            },
                          ),

                          // Nome
                          CustomTextField(
                            icon: Icons.person_outline,
                            label: 'Nome',
                            validator: nameValidator,
                            onSaved: (value) {
                              authController.user.name = value;
                            },
                          ),

                          // Celular
                          CustomTextField(
                            icon: Icons.phone_android_outlined,
                            label: 'Celular',
                            textInputType: TextInputType.phone,
                            inputFormatters: [phoneFormatter],
                            validator: phoneValidator,
                            onSaved: (value) {
                              authController.user.phone = value;
                            },
                          ),

                          // CPF
                          CustomTextField(
                            icon: Icons.aspect_ratio_outlined,
                            label: 'CPF',
                            textInputType: TextInputType.number,
                            inputFormatters: [cpfFormatter],
                            validator: cpfValidator,
                            onSaved: (value) {
                              authController.user.cpf = value;
                            },
                          ),

                          // Botão para cadastro
                          SizedBox(
                            height: 50,
                            child: Obx(() {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        // Remover teclado da tela, após CADASTRAR Usuário
                                        FocusScope.of(context).unfocus();

                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          authController.signUp();
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Cadastrar Usuário',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
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
