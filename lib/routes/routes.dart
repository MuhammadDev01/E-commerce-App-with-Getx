import 'package:ecommerce_with_mvc/logic/blindings/auth_binding.dart';
import 'package:ecommerce_with_mvc/logic/blindings/main_binding.dart';
import 'package:ecommerce_with_mvc/logic/blindings/products_binding.dart';
import 'package:ecommerce_with_mvc/views/pages/auth/forget_password_page.dart';
import 'package:ecommerce_with_mvc/views/pages/auth/login_page.dart';
import 'package:ecommerce_with_mvc/views/pages/auth/signup_page.dart';
import 'package:ecommerce_with_mvc/views/pages/cart/cart_items_page.dart';
import 'package:ecommerce_with_mvc/views/pages/main_page.dart';
import 'package:ecommerce_with_mvc/views/pages/welcome_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomePage;
  static const main = Routes.mainPage;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.welcomePage,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpPage,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordPage,
      page: () => const ForgotPasswprdPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainPage,
      page: () =>  MainPage(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductsBinding(),
      ],
    ),
    GetPage(
      name: Routes.cardItemsPage,
      page: () => const CartItemsPage(),
      binding: ProductsBinding(),
    ),
  ];
}

class Routes {
  static const welcomePage = '/welcomePage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const mainPage = '/mainPage';
  static const cardItemsPage = '/cardItemsPage';
}
