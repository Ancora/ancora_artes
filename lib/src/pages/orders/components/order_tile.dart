import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/cart_item_model.dart';
import 'package:ancora_artes/src/models/order_model.dart';
import 'package:ancora_artes/src/pages/common_widgets/payment_dialog.dart';
import 'package:ancora_artes/src/pages/orders/components/order_status_widget.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 1,
        ),
        elevation: 2,
        color: CustomColors.customBlueMedium, // background do card expandido
        shadowColor: CustomColors.customBlueDark,
        /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ), */

        // Cabeçalho do pedido e botão para mostrar seus detalhes
        // Usar Theme para inibir as bordas do ExpansionTile
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: order.status ==
                'pending_payment', // expandido apenas se pagamento não efetuado
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            collapsedBackgroundColor:
                CustomColors.customBlueDark, // background do card retraído
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pedido: ${order.id}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  utilsServices.formatDateTime(
                      order.createdDateTime), // formatar em utils_services.dart
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),

            // Detalhes do pedido
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    // Lista de produtos
                    Expanded(
                      flex: 3, // define a largura do Expanded: neste caso 3/5
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            // retornar um widget customizado
                            return _OrderItemWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    // Divisor vertical
                    VerticalDivider(
                      color: Colors.grey.shade200,
                      thickness: 2,
                      width: 8,
                    ),

                    // Área de status do pedido
                    Expanded(
                      flex: 2, // define a largura do Expanded: neste caso 2/5
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                      ),
                    ),
                  ],
                ),
              ),

              // Total do pedido
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Total ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: utilsServices.priceToCurrency(order.total),
                      ),
                    ],
                  ),
                ),
              ),

              // Botão para pagamento PIX
              Visibility(
                visible: order.status == 'pending_payment',
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return PaymentDialog(
                            order: order,
                          );
                        },
                      );
                    },
                    label: const Text(
                      'Gerar QR Code PIX',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(Icons.pix),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
              style: const TextStyle(
                color: Colors.white60,
              ),
            ),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
            style: const TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
