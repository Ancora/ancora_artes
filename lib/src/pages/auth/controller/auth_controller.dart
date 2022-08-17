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
        /* navegação */
        Get.offAllNamed(PagesRoutes.baseRoute);
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
