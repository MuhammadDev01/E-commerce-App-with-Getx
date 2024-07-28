import 'package:ecommerce_with_mvc/languages/6.1%20ar.dart';
import 'package:ecommerce_with_mvc/languages/6.2%20en.dart';
import 'package:ecommerce_with_mvc/languages/6.4%20fr.dart';
import 'package:get/route_manager.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
        'fr': fr,
      };
}
