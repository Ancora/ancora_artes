import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/cart_item_model.dart';
import 'package:ancora_artes/src/pages/cart/components/cart_tile.dart';
import 'package:ancora_artes/src/pages/common_widgets/payment_dialog.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:ancora_artes/src/config/app_data.dart' as app_data;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);

      // Apresentação do Toast
      utilsServices.showToast(
        message: '${cartItem.item.itemName} removido com sucesso!',
      );
    });
  }

  // Totalizar o carrinho
  double cartTotalPrice() {
    double total = 0;

    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/logoAncoraResina.png',
              width: 100,
            ),
            /* Icon(
              Icons.shopping_cart_outlined,
              color: CustomColors.customBlueLight,
            ), */
            Text(
              'Carrinho',
              style: TextStyle(
                fontSize: 20,
                color: CustomColors.customBlueLight,
              ),
            ),
          ],
        ),
      ),

      // Lista de itens do carrinho
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: app_data.cartItems.length,
              itemBuilder: (_, index) {
                final cartItem = app_data.cartItems[index];
                return CartTile(
                    cartItem: app_data.cartItems[index],
                    updatedQuantity: (qtd) {
                      if (qtd == 0) {
                        removeItemFromCart(app_data.cartItems[index]);
                      } else {
                        setState(() {
                          cartItem.quantity = qtd;
                        });
                      }
                    }
                    // remove: removeItemFromCart,
                    );
              },
            ),
          ),

          // Área do total e finalizar compra
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CustomColors.customBlueMedium,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.customBlueDark,
                  offset: const Offset(3, 3),
                ),
              ],
            ),

            // Rodapé com valor total e botão para fechar pedido
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título do fechamento
                const Text(
                  'Total do carrinho',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),

                // Valor total do pedido
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Botão para finalizar compra
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: app_data.orders.first,
                            );
                          },
                        );
                      } else {
                        // Apresentação do Toast
                        utilsServices.showToast(
                          message: 'Pedido não concluído!',
                          isError: true,
                        );
                      }
                    },
                    label: const Text(
                      'Fechar Pedido',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dialog de confirmação do fechamento do pedido
  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: CustomColors.customBlueLight,
          title: const Text(
            'Confirmação',
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          content: const Text(
            'Deseja realmente concluir o pedido?',
            style: TextStyle(
              color: Colors.white60,
            ),
          ),
          actions: [
            // Negativo
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),

            // Positivo
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
