import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/item_model.dart';
import 'package:ancora_artes/src/pages/product/product_screen.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  // atributo para a animação
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  // Troca de ícone (trocar para StatefulWidget)
  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check_outlined);
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }
  // ------------ //

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteúdo do tile, onde de ver ser clicado para ir aos detalhes do item
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (c) {
                return ProductScreen(item: widget.item,);
              }),
            );
          },
          child: Card(
            elevation: 2,
            shadowColor: CustomColors.customBlueLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(
                        widget.item.imgUrl,
                        // animação
                        key: imageGk,
                      ),
                    ),
                  ),

                  // Código e nome
                  Text(
                    widget.item.code,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customBlueMedium.shade400,
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.customBlueLight.shade400,
                    ),
                  ),

                  // Preço
                  Text(
                    utilsServices.priceToCurrency(widget.item.price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.customBlueMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        // Botão para adicionar produto ao carrinho
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  // chamada do método de troca de ícone
                  switchIcon();
                  // chamada do método de animação
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 35,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.customBlueLight,
                  ),
                  child: Icon(
                    // Trocar ícone ao adicionar produto no carrinho: necessário colocar o ícone em uma variável
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
