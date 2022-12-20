import 'package:sistem_pakar_pajak/models/subcategory_bu.dart';

class CategoryBu {
  String? name;
  String? imgName;
  List<SubCategoryBu>? subCategories;

  CategoryBu({
    this.name,
    this.imgName,
    this.subCategories,
  });

  factory CategoryBu.fromJson(Map<String, dynamic> json) {
    return CategoryBu(
      name: json['name'],
      imgName: json['imgname'],
      subCategories: SubCategoryBu.fromJsonArray(json['pertanyaan_bu']),
    );
  }
}
