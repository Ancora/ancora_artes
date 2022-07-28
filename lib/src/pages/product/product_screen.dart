import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/models/item_model.dart';
import 'package:ancora_artes/src/pages/common_widgets/quantity_widget.dart';
import 'package:ancora_artes/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customBlueLight.shade900,
      body: Stack(
        children: [
          // Conteúdo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                // Área da imagem
                Expanded(
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: CustomColors.customBlueMedium,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      margin: const EdgeInsets.all(8),
                      child: Hero(
                        tag: widget.item.imgUrl,
                        child: Image.asset(
                          widget.item.imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Área dos detalhes
                Expanded(
                  child: Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Nome - Quantidade
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.item.itemName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                            QuantityWidget(
                              suffixText: widget.item.unit,
                              value: cartItemQuantity,
                              result: (quantity) {
                                setState(() {
                                  cartItemQuantity = quantity;
                                });
                              },
                            ),
                          ],
                        ),

                        // Preço
                        Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),

                        // Descrição
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: SingleChildScrollView(
                              child: Text(
                                widget.item.description,
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Botão de adicionar ao carrinho
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            label: const Text(
                              'Adicionar ao Carrinho',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            icon: const Icon(Icons.add_shopping_cart_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Botão para retornar à tela anterior
          Positioned(
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                color: CustomColors.customBlueDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
