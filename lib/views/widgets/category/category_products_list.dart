import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/pages/home/product_details_page.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/card_item_builder_home.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsList extends StatefulWidget {
  const CategoryProductsList({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<CategoryProductsList> createState() => _CategoryProductsListState();
}

class _CategoryProductsListState extends State<CategoryProductsList> {
  final controller = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    controller.getCategoryList(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            centerTitle: true,
            backgroundColor: mainColor,
            title: TextUtils(
              fontSize: 20,
              text: controller.capitalize(name: widget.categoryName),
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          body: (controller.categoriesList.isEmpty)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GridView.builder(
                    itemCount: controller.categoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      return CardItemBuilder(
                        model: controller.categoriesList[index],
                        productId: controller.categoriesList[index].id,
                        index: index,
                        onTap: () {
                          Get.to(() => ProductDetailsPage(
                              product: controller.categoriesList[index]));
                        },
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
        ),
      ),
    );
  }
}
