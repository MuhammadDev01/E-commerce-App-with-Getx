import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/views/widgets/category/category_products_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key});
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => CategoryItemBuilder(
            categoryName: controller.categoriesNames[index]),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: controller.categoriesNames.length,
      ),
    );
  }
}

class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CategoryProductsWidget());
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1721198516755-6a571b396236?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextUtils(
              text: categoryName,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
