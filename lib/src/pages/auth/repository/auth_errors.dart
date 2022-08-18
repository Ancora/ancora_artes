String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail e/ou senha inválidos!';
    case 'Invalid session token':
      return 'Token inválido';
    case 'INVALID_FULLNAME':
      return 'Erro ao cadastrar usuário: NOME inválido!';
    case 'INVALID_PHONE':
      return 'Erro ao cadastrar usuário: CELULAR inválido!';
    case 'INVALID_CPF':
      return 'Erro ao cadastrar usuário: CPF inválido!';
    default:
      return 'Erro indefinido ocorreu!';
  }
}
