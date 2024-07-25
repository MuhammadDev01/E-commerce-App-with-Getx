import 'package:ecommerce_with_mvc/helper/api_helper.dart';

class CategoriesService {
  Future<List<dynamic>> getCategoriesNames() async {
    List<dynamic> data =
        await ApiHelper().get(url: '${ApiHelper.baseUrl}/products/categories');

    return data;
  }
}
