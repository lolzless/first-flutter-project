// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sistem_pakar_pajak/models/subcategory.dart';

class Category {
  String? name;
  String? imgName;
  List<SubCategory>? subCategories;

  Category({
    this.name,
    this.imgName,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      imgName: json['imgname'],
      subCategories: SubCategory.fromJsonArray(json['pertanyaan_op']),
    );
  }
}
