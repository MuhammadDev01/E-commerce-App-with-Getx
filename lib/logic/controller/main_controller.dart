import 'package:ecommerce_with_mvc/views/pages/category_page.dart';
import 'package:ecommerce_with_mvc/views/pages/favorites_page.dart';
import 'package:ecommerce_with_mvc/views/pages/home_page.dart';
import 'package:ecommerce_with_mvc/views/pages/settings_page.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  bool switchValue = false;
  GetStorage storage = GetStorage();

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

  //Language

  String get getLanguage {
    return storage.read("lang") ?? 'en';
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  void changeLangauge(String type) {
    Get.updateLocale(Locale(type));
    saveLanguage(type);
    update();
  }

//payment
  RxString phone = 'xxxxxxxxxxx'.obs;

   var address = 'Your Address'.obs;
  //var paymentItems = <PaymentItem>[].obs;

  //Location

  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    address.value = "${place.country},${place.street}";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

}
