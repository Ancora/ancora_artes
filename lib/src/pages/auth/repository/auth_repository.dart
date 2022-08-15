import 'package:ancora_artes/src/constants/endpoints.dart';
import 'package:ancora_artes/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  /* Método para login */
  Future signIn({
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

    /* Verifica se há dados em RESULT */
    if (result['result'] != null) {
      print('SignIn funcionou!');
      print(result['result']);
    } else {
      print('SignIn NÃO funcionou!');
      print(result['error']);
    }
  }
}
