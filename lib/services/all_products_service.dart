import 'package:ecommerce_with_mvc/helper/api_helper.dart';
import 'package:ecommerce_with_mvc/models/products_model.dart';

class AllProudctService {
  Future<List<ProductsModel>> getallproduct() async {
    List<dynamic> data =
        await ApiHelper().get(url: '${ApiHelper.baseUrl}/products');

    List<ProductsModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductsModel.fromJson(data[i]),
      );
    }

    return productList;
  }
}
