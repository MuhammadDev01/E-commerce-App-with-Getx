import 'package:ecommerce_with_mvc/firebase_options.dart';
import 'package:ecommerce_with_mvc/languages/6.5%20localiztion.dart';
import 'package:ecommerce_with_mvc/logic/controller/theme_controller.dart';
import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read('lang') ?? 'en'),
      fallbackLocale: const Locale('en'),
      translations: LocaliztionApp(),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read('auth') == true
          ? AppRoutes.main
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
    );
  }
}
