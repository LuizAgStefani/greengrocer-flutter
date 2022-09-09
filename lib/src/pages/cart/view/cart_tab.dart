import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/pages/cart/view/components/cart_tile.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();
  final cartController = Get.find<CartController>();

  // void removeItemFromCart(CartItemModel cartItem) {
  //   // setState(() {
  //   //   app_data.cartItems.remove(cartItem);
  //   // });
  // }

  double cartTotalPrice() {
    // double total = 0;
    // for (var item in app_data.cartItems) {
    //   total += item.totalPrice();
    // }
    // return total;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<CartController>(
            builder: (cartController) {
              if (cartController.cartItems.isEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 40,
                        color: CustomColors.customSwatchColor,
                      ),
                      Text(
                        'Não há itens no carrinho',
                        style: TextStyle(
                          color: CustomColors.customSwatchColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTile(
                        cartItem: cartController.cartItems[index],
                      );
                    },
                  ),
                );
              }
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total Geral',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                GetBuilder<CartController>(
                  builder: (cartController) {
                    return Text(
                      utilsServices
                          .priceToCurrency(cartController.cartTotalPrice()),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 50,
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CustomColors.customSwatchColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: cartController.isCheckoutLoading
                              ? null
                              : () async {
                                  bool? result = await showOrderConfirmation();

                                  if (result ?? false) {
                                    cartController.checkoutCart();
                                  } else {
                                    utilsServices.showToast(
                                      message: 'Pedido não confirmado',
                                      backgroundColor: Colors.yellow[900]!,
                                    );
                                  }
                                },
                          child: cartController.isCheckoutLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Concluir Pedido',
                                  style: TextStyle(fontSize: 18),
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
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
