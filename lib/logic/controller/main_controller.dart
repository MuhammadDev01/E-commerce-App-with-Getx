import 'package:ecommerce_with_mvc/views/pages/category_page.dart';
import 'package:ecommerce_with_mvc/views/pages/favorites_page.dart';
import 'package:ecommerce_with_mvc/views/pages/home_page.dart';
import 'package:ecommerce_with_mvc/views/pages/settings_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  bool switchValue = false;

  final List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    FavoritesPage(),
    SettingsPage(),
  ].obs;
  final List<String> titles = [
    "Ben Khaled Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;
}
