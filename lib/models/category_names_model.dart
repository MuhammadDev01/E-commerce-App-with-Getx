class CategoryNamesModel {
  List<String>? categoryName;

  CategoryNamesModel({required this.categoryName});
  factory CategoryNamesModel.fromJson(data) {
    return CategoryNamesModel(categoryName: data);
  }
}
