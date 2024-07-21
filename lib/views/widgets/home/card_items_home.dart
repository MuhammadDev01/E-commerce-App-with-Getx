import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/pages/home/product_details_page.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/card_item_builder_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemsHome extends StatelessWidget {
  CardItemsHome({super.key});
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.productList.isEmpty) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
            color: Colors.white,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchController.text.isNotEmpty
              ? Get.isDarkMode? Image.asset(
                  'assets/images/search_empty_dark.png',
                ):Image.asset(
                  'assets/images/search_empry_light.png',
                )
              : GridView.builder(
                  itemCount: controller.productList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return CardItemBuilder(
                        model: controller.productList[index],
                        productId: controller.productList[index].id,
                        index: index,
                        onTap: () {
                          Get.to(() => ProductDetailsPage(
                              product: controller.productList[index]));
                        },
                      );
                    } else {
                      return CardItemBuilder(
                        model: controller.searchList[index],
                        productId: controller.searchList[index].id,
                        index: index,
                        onTap: () {
                          Get.to(() => ProductDetailsPage(
                              product: controller.searchList[index]));
                        },
                      );
                    }
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
        );
      }
    });
  }
}
