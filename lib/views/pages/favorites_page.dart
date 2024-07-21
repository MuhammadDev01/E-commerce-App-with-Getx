import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (_) => Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: controller.favoriteList.isEmpty
            ? emptyFavoriteProductsWidget()
            : Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => favoriteItemBuilder(
                    controller.favoriteList[index],
                    context,
                    controller,
                    controller.favoriteList[index].id,
                  ),
                  itemCount: controller.favoriteList.length,
                ),
              ),
      ),
    );
  }

  Widget favoriteItemBuilder(ProductsModel model, BuildContext context,
      ProductsController controller, int productID) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                model.image,
                width: 100,
                height: 120,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavoriteList(productID);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyFavoriteProductsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/heart.png",
            scale: 2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 15,
          ),
          const TextUtils(
            text: "No Favorite Products here.",
            fontSize: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
