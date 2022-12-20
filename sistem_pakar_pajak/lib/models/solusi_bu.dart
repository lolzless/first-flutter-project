import 'package:sistem_pakar_pajak/models/sub_solusi_bu.dart';

class SolusiBu {
  String? name;
  List<SubSolusiBu>? subCategories;

  SolusiBu({
    this.name,
    this.subCategories,
  });

  factory SolusiBu.fromJson(Map<String, dynamic> json) {
    return SolusiBu(
      name: json['nama'],
      subCategories: SubSolusiBu.fromJsonArray(json['solusi_masalah_bu']),
    );
  }
}
