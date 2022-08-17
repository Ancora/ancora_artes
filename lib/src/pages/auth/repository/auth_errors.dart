String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail e/ou senha inválidos!';
    default:
      return 'Erro indefinido ocorreu!';
  }
}
