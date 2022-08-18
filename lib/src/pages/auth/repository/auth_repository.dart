import 'package:ancora_artes/src/constants/endpoints.dart';
import 'package:ancora_artes/src/models/user_model.dart';
import 'package:ancora_artes/src/pages/auth/repository/auth_errors.dart'
    as auth_errors;
import 'package:ancora_artes/src/pages/auth/result/auth_result.dart';
import 'package:ancora_artes/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  /* Verificação se há dados em RESULT */
  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }

  /* Validação do token */
  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token,
        });

    /* Retorno da verificação de dados em RESULT */
    return handleUserOrError(result);
  }

  /* Método para login */
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    /* Retorno da verificação de dados em RESULT */
    return handleUserOrError(result);
  }

  /* Método para cadastro de novo usuário */
  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    /* Retorno da verificação de dados em RESULT */
    return handleUserOrError(result);
  }
}
