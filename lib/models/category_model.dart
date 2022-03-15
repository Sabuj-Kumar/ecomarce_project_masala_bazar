class CategoryModel {
  String? category;
  List<SubCategoryModel>? subCategory;
  late bool checkValue;

  CategoryModel({this.category, this.subCategory, this.checkValue = false});
}

class SubCategoryModel{
  String? subCategory;
  late bool checkValue;

  SubCategoryModel({this.subCategory, this.checkValue = false});
}
