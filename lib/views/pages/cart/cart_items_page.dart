import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/pages/payments/payment_page.dart';
import 'package:ecommerce_with_mvc/views/widgets/cart/cart_item_builder.dart';
import 'package:ecommerce_with_mvc/views/widgets/cart/empty_cart_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});

  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
          automaticallyImplyLeading: false,
          title: Text(
            "Cart Items",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                cartController.clearAllProducts();
              },
              icon: const Icon(
                Icons.backspace,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Obx(
          () => cartController.productsMap.isNotEmpty
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItemBuilder(
                          product:
                              cartController.productsMap.keys.toList()[index],
                          index: index,
                        ),
                        itemCount: cartController.productsMap.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                      ),
                    ),
                    TotalCartProductsWidget(
                      textButton: "Check Out",
                      total: cartController.total,
                      onPressed: () {
                        Get.to(() => const PaymentPage());
                      },
                    ),
                  ],
                )
              : const EmptyCartWidget(),
        ),
      ),
    );
  }
}

class TotalCartProductsWidget extends StatelessWidget {
  const TotalCartProductsWidget(
      {super.key,
      required this.textButton,
      required this.total,
      this.onPressed});
  final String textButton;
  final String total;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontQuicksand,
                  ),
                ),
                Text(
                  "\$$total",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontQuicksand,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor:
                        Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: textButton,
                        fontSize: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
