import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  /* Métodos referentes ao TOKEN */
  final storage = const FlutterSecureStorage();

  // Salvando token localmente
  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await storage.write(
      key: key,
      value: data,
    );
  }

  // Recuperando dados locais
  Future<String?> getLocalData({
    required String key,
  }) async {
    return await storage.read(key: key);
  }

  // Removendo dados locais
  Future<void> removeLocalData({
    required String key,
  }) async {
    await storage.delete(key: key);
  }

  /* TOKEN */

  // Retornar valor precedido de R$, a partir de uma string
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  // Retornar data formatada
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  // Apresentação de toast
  void showToast({
    required String message,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : CustomColors.customBlueLight,
      textColor: isError ? Colors.white : CustomColors.customBlueDark,
      fontSize: 16.0,
    );
  }
}
