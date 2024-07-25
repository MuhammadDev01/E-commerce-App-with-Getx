import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/views/widgets/category/category_products_list.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key});
  final controller = Get.find<ProductsController>();
  final categoriesImages = const [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => CategoryItemBuilder(
          categoryName: controller.categoriesNames[index],
          categoryImage: categoriesImages[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: controller.categoriesNames.length,
      ),
    );
  }
}

class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CategoryProductsList(
              categoryName: categoryName,
            ));
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(categoryImage),
          ),
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
