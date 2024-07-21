import 'package:ecommerce_with_mvc/helper/api_helper.dart';
import 'package:ecommerce_with_mvc/models/category_names_model.dart';

class CategoriesService {
  Future<CategoryNamesModel> getCategoriesNames() async {
    CategoryNamesModel data = CategoryNamesModel.fromJson(
        await ApiHelper().get(url: '${ApiHelper.baseUrl}/products/categories'));

    return data;
  }
}
