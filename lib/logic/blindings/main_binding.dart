import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
  }

}