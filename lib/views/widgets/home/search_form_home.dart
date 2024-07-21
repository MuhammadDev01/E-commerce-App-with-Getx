import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormHome extends StatelessWidget {
  const SearchFormHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    return Obx(
      () => TextField(
        style: const TextStyle(
          color: Colors.black, // تعيين لون النص هنا بناءً على القيمة المدخلة
        ),
        controller: controller.searchController,
        onChanged: (value) {
          controller.searchText.value = value;
          controller.addSearchToList(value);
        },
        onSubmitted: (value) {
          if (controller.searchText.isEmpty) {
            controller.searchList.clear();
          }
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Search product...",
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.blueGrey,
                fontSize: 14,
              ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: controller.searchText.value.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: const Icon(Icons.close),
                )
              : null,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
