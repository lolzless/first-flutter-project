import 'dart:ui';

import 'package:sistem_pakar_pajak/models/category_bu.dart';
import 'package:sistem_pakar_pajak/models/kondisi_bu.dart';

class SubCategoryBu {
  String? kodepertanyaan;
  String? pertanyaan;
  KondisiBu? isTrue;
  KondisiBu? isFalse;

  SubCategoryBu({
    this.kodepertanyaan,
    this.pertanyaan,
    this.isTrue,
    this.isFalse,
  });

  factory SubCategoryBu.fromJson(Map<String, dynamic> json) {
    return SubCategoryBu(
      kodepertanyaan: json['kode_pertanyaan'],
      pertanyaan: json['pertanyaan'],
      isTrue: KondisiBu.fromJson(json['is_true']),
      isFalse: KondisiBu.fromJson(json['is_false']),
    );
  }

  static List<SubCategoryBu> fromJsonArray(List<dynamic> jsonArray) {
    List<SubCategoryBu> subCategoriesFromJson = [];
    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(SubCategoryBu.fromJson(jsonData));
    });
    return subCategoriesFromJson;
  }
}
