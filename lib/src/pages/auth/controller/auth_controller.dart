import 'package:ancora_artes/src/constants/storage_keys.dart';
import 'package:ancora_artes/src/models/user_model.dart';
import 'package:ancora_artes/src/pages/auth/repository/auth_repository.dart';
import 'package:ancora_artes/src/pages/auth/result/auth_result.dart';
import 'package:ancora_artes/src/pages_routes/app_pages.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  /* @override
  void onInit() {
    super.onInit();
    validateToken();
  } */

  /* Recuperação e Validação do token salvo */
  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(
      key: StorageKeys.token,
    );

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para tela de login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  /* Salvando Token e direcionando para a tela base */
  void saveTokenAndProceedToBase() {
    // Salvar o Token
    utilsServices.saveLocalData(
      key: StorageKeys.token,
      data: user.token!,
    );

    // Ir para tela base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  /* Login (SIGNIN) */
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;

    result.when(
      success: (user) {
        /* this.user refere-se ao objeto da classe; user é do retorno em success */
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  /* Cadastro de novo usuário (SIGNUP) */
  Future<void> signUp() async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
