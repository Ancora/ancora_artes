import 'package:get/get.dart';

/* Validação de e-mail */
String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu E-mail!';
  }

  if (!email.isEmail) return 'Digite um E-mail válido!';

  return null;
}

/* Validação da senha */
String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua Senha!';
  }

  if (password.length < 8) {
    return 'A senha deve ter 8 caracteres ou mais!';
  }

  return null;
}

/* Validação do nome */
String? nameValidator(String? name) {
  // Verifica se nulo ou vazio
  if (name == null || name.isEmpty) {
    return 'Digite seu nome!';
  }

  // Verifica se digitou um nome composto
  final names = name.split(' ');
  if (names.length == 1) return 'Digite seu nome completo!';
  return null;
}

/* Validação do celular */
String? phoneValidator(String? phone) {
  // Verifica se nulo ou vazio
  if (phone == null || phone.isEmpty) {
    return 'Digite seu celular!';
  }

  // Verifica se é um número de telefone
  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Digite um número válido!';
  }
  return null;
}

/* Validação do CPF */
String? cpfValidator(String? cpf) {
  // Verifica se nulo ou vazio
  if (cpf == null || cpf.isEmpty) {
    return 'Digite seu CPF!';
  }

  // Verifica se é um CPF válido
  if (!cpf.isCpf) return 'Digite um CPF válido';
  return null;
}
