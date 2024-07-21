import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap productsMap = {}.obs;

  void addProductToCart(ProductsModel productsModel) {
    if (productsMap.containsKey(productsModel)) {
      productsMap[productsModel] += 1;
    } else {
      productsMap[productsModel] = 1;
    }
  }

  void removeProductsFromCart(ProductsModel productsModel) {
    if (productsMap.containsKey(productsModel) &&
        productsMap[productsModel] <= 1) {
      productsMap.removeWhere((key, value) {
        return key == productsModel;
      });
    } else {
      productsMap[productsModel] -= 1;
    }
  }

  void removeOneProduct(ProductsModel productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cardItemsPage);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
