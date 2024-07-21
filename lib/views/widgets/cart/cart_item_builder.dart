import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemBuilder extends StatelessWidget {
  const CartItemBuilder(
      {super.key, required this.product, required this.index});
  final ProductsModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  width: 120,
                  fit: BoxFit.cover,
                  product.image,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                controller.removeProductsFromCart(product);
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              ))),
                      Text(
                        controller.productsMap[product].toString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            controller.addProductToCart(product);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      controller.removeOneProduct(product);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Get.isDarkMode ? Colors.white : Colors.red[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
