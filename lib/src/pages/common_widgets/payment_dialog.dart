import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/order_model.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: CustomColors.customBlueLight,
      child: Stack(
        alignment: Alignment.center,
        children: [

          // Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com PIX',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // QR Code
                QrImage(
                  data: "Anderson Rocha",
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                // Vencimento
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                // Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Botão copiar e colar
                SizedBox(
                  height: 50,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    label: const Text(
                      'Copiar código PIX',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(Icons.copy_outlined),
                  ),
                ),
              ],
            ),
          ),

          // Botão para fechar o dialog
          Positioned(
            top: -5,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: CustomColors.customBlueDark,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
