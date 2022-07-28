import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ancora_artes/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/logoAncoraResina.png',
              width: 100,
            ),
            /* Icon(
              Icons.person_outlined,
              color: CustomColors.customBlueLight,
            ), */
            Text(
              'Perfil do Usuário',
              style: TextStyle(
                fontSize: 20,
                color: CustomColors.customBlueLight,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout_outlined,
              color: CustomColors.customBlueLight,
            ),
          ),
        ],
      ),

      // Formulário com ListView
      body: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CustomColors.customBlueLight,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            // E-mail
            CustomTextField(
              readOnly: true,
              initialValue: app_data.user.email,
              icon: Icons.email_outlined,
              label: 'E-mail',
            ),

            // Nome
            CustomTextField(
              readOnly: true,
              initialValue: app_data.user.name,
              icon: Icons.person_outline,
              label: 'Nome',
            ),

            // Celular
            CustomTextField(
              readOnly: true,
              initialValue: app_data.user.phone,
              icon: Icons.phone_android_outlined,
              label: 'Celular',
            ),

            // CPF
            CustomTextField(
              readOnly: true,
              initialValue: app_data.user.cpf,
              icon: Icons.aspect_ratio_outlined,
              label: 'CPF',
              isSecret: true,
            ),

            // Botão para atualizar senha
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
                  updatePassword();
                },
                child: const Text(
                  'Atualizar Senha',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: CustomColors.customBlueLight,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 6, 0, 16),
                      child: Text(
                        'Atualizar senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white54,
                        ),
                      ),
                    ),

                    // Senha atual
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isSecret: true,
                    ),

                    // Nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                      isSecret: true,
                    ),

                    // Confirmar nova senha
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                      isSecret: true,
                    ),

                    // Botão para confirmação
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
                          'Atualizar',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Botão para fechar o dialog
              Positioned(
                top: 2,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
