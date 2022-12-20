import 'dart:ui';

import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/models/kondisi.dart';

class SubCategory {
  String? kodepertanyaan;
  String? pertanyaan;
  Kondisi? isTrue;
  Kondisi? isFalse;

  SubCategory({
    this.kodepertanyaan,
    this.pertanyaan,
    this.isTrue,
    this.isFalse,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      kodepertanyaan: json['kode_pertanyaan'],
      pertanyaan: json['pertanyaan'],
      isTrue: Kondisi.fromJson(json['is_true']),
      isFalse: Kondisi.fromJson(json['is_false']),
    );
  }

  static List<SubCategory> fromJsonArray(List<dynamic> jsonArray) {
    List<SubCategory> subCategoriesFromJson = [];
    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(SubCategory.fromJson(jsonData));
    });
    return subCategoriesFromJson;
  }
}
