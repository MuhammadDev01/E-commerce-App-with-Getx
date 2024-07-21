import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:get/get.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.lazyPut(() => CartController());
  }
}
