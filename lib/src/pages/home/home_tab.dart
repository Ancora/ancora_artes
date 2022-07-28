import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/common_widgets/app_logo_widget.dart';
import 'package:ancora_artes/src/pages/home/components/category_tile.dart';
import 'package:ancora_artes/src/pages/home/components/item_tile.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ancora_artes/src/config/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Relógios de Parede';

  // Componentes para animação
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }
  // ----------- //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // Título
        title: const AppLogoWidget(
          widthLogo: 100,
        ),

        // Ícone do Carrinho
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customBlueLight.shade900,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12, // padrão: 14
                  ),
                ),
                // envolver o ícone para a animação
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: CustomColors.customBlueLight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      /* Necessário envolver todo o conteúdo da página no widget, para que a animação do produto ao carrinho funcione */
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            // Campo de pesquisa
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: CustomColors.customBlueLight,
                  isDense: true,
                  hintText: 'Pesquisar produto...',
                  hintStyle: TextStyle(
                    color: CustomColors.customBlueDark.shade500,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customBlueDark.shade400,
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            // Categorias
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount:
                    app_data.categories.length, // quantidade de itens na lista
              ),
            ),

            // Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                physics:
                    const BouncingScrollPhysics(), // altera a animação ao arrastar a grid para baixo
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 9 / 12, // medidas de cada item do grid
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: app_data.items[index],
                    // atributo para animação
                    cartAnimationMethod: itemSelectedCartAnimations,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
