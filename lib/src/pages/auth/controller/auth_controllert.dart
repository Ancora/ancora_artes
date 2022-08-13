import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    /* Delay temporário, será substituído pelo tempo de acesso normal ao backend */
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
  }
}
