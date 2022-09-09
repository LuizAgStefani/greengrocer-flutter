import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    Key? key,
    required this.itemModel,
    required this.cartAnimationMethod,
  }) : super(key: key);

  final ItemModel itemModel;

  final void Function(GlobalKey) cartAnimationMethod;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();
  final cartController = Get.find<CartController>();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Color colorAddToCard = CustomColors.customSwatchColor;

  Future<void> switchIcon() async {
    setState(() {
      tileIcon = Icons.check;
      colorAddToCard = Colors.green;
    });

    await Future.delayed(const Duration(milliseconds: 2000));

    setState(() {
      tileIcon = Icons.add_shopping_cart_outlined;
      colorAddToCard = CustomColors.customSwatchColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteúdo
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.productRoute, arguments: widget.itemModel);
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                    child: Hero(
                      tag: widget.itemModel.img,
                      child: Image.network(
                        widget.itemModel.img,
                        key: imageGk,
                      ),
                    ),
                  ),

                  //Nome
                  Text(
                    widget.itemModel.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Preço - Unidade
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.itemModel.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${widget.itemModel.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Botão add
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(15),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  cartController.addItemToCart(item: widget.itemModel);
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: colorAddToCard,
                  ),
                  height: 40,
                  width: 35,
                  child: Icon(
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
