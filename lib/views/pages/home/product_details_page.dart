import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/pages/cart/cart_items_page.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/productDetails/image_slider_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/productDetails/product_info_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/productDetails/size_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key, required this.product});
  final ProductsModel product;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSliderWidget(
                imageProduct: product.image,
              ),
              ProductInfoWidget(
                titleProduct: product.title,
                ratingProduct: product.rating.rate,
                descProduct: product.description,
                idProduct: product.id,
              ),
              const SizeListWidget(),
              TotalCartProductsWidget(
                textButton: "Add to Cart",
                total: product.price.toString(),
                onPressed: () {
                  controller.addProductToCart(product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
