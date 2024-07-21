import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/pages/home/product_details_page.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/card_item_builder_home.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsWidget extends StatelessWidget {
  CategoryProductsWidget({super.key});
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          centerTitle: true,
          backgroundColor: mainColor,
          title: TextUtils(
            fontSize: 20,
            text: 'Category items',
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return CardItemBuilder(
                model: controller.productList[index],
                productId: controller.productList[index].id,
                index: index,
                onTap: () {
                  Get.to(() => ProductDetailsPage(
                      product: controller.productList[index]));
                },
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
