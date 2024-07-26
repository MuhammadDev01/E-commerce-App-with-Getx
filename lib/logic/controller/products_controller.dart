import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:ecommerce_with_mvc/services/all_products_service.dart';
import 'package:ecommerce_with_mvc/services/categories_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {
  RxList<ProductsModel> productList = <ProductsModel>[].obs;
  List<ProductsModel> favoriteList = <ProductsModel>[].obs;
  GetStorage storage = GetStorage();

  //search
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs; // استخدام RxString لتتبع النص
  var searchList = <ProductsModel>[].obs;
  List<dynamic> categoriesNames = [];
  var categoriesList = <ProductsModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    // get products in home page
    productList.value = await AllProudctService().getallproduct();

    // get favorite products in favorites page
    List? favoriteListStorage = storage.read<List>("isFavoritesList");
    if (favoriteListStorage != null) {
      favoriteList =
          favoriteListStorage.map((e) => ProductsModel.fromJson(e)).toList();
    }

    //get categories in category page
    categoriesNames = await CategoriesService().getCategoriesNames();

    update();
  }

  //Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchController.clear();
    searchText.value = ''; // إعادة تعيين النص
    addSearchToList("");
  }

  //favorite page
  void manageFavoriteList(int productId) async {
    var cuurentIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (cuurentIndex >= 0) {
      favoriteList.removeAt(cuurentIndex);
      await storage.remove("isFavoritesList");
    } else {
      favoriteList.add(
        productList.firstWhere((element) => element.id == productId),
      );
      await storage.write("isFavoritesList", favoriteList);
    }

    update();
  }

  bool addToFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  //category page
  void getCategoryList({required String categoryName}) async {
    categoriesList.clear();

    await CategoriesService()
        .getCategory(categoryName: categoryName)
        .then((products) {
      for (var product in products) {
        categoriesList.add(ProductsModel.fromJson(product));
      }
    });
  }


  String capitalize({required String name}){
    return name.split("").map((e) => e.capitalize).join(" ");
  }
}
