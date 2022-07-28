import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/orders/components/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:ancora_artes/src/config/app_data.dart' as app_data;

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

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
              Icons.shopping_basket_outlined,
              color: CustomColors.customBlueLight,
            ), */
            Text(
              'Meus Pedidos',
              style: TextStyle(
                fontSize: 20,
                color: CustomColors.customBlueLight,
              ),
            ),
          ],
        ),
      ),

      // Conteúdo
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return OrderTile(
            order: app_data.orders[index],
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: app_data.orders.length,
      ),
    );
  }
}
