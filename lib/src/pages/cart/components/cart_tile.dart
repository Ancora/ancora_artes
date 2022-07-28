import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/cart_item_model.dart';
import 'package:ancora_artes/src/pages/common_widgets/quantity_widget.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  //final Function(CartItemModel) remove;
  final Function(int) updatedQuantity;

  const CartTile({
    super.key,
    required this.cartItem,
    //required this.remove,
    required this.updatedQuantity,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 1,
      ),
      elevation: 2,
      color: CustomColors.customBlueDark,
      shadowColor: CustomColors.customBlueMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 50,
          width: 50,
        ),

        // Título
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColors.customBlueLight,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customBlueLight,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        // Quantidade
        trailing: QuantityWidget(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          /* result: (quantity) {
            setState(() {
              // Atualizar quantidade
              widget.cartItem.quantity = quantity;

              // Remover item do carrinho
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          }, */
          result: widget.updatedQuantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
