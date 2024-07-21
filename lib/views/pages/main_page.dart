import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: Text(
              controller.titles[controller.currentIndex.value],
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            leading: const SizedBox(),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: badges.Badge(
                  badgeContent: Text(cartController.quantity().toString()),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: pinkClr.withOpacity(0.7),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cardItemsPage);
                    },
                    icon: Image.asset(
                      'assets/images/shop.png',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            elevation: 0.0,
            selectedItemColor: Get.isDarkMode ? pinkClr : mainColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
          ),
          body: controller.pages[controller.currentIndex.value],
        ),
      ),
    );
  }
}
