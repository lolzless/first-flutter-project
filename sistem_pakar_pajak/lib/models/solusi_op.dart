import 'package:sistem_pakar_pajak/models/sub_solusi_op.dart';

class SolusiOp {
  String? name;
  List<SubSolusiOp>? subCategories;

  SolusiOp({
    this.name,
    this.subCategories,
  });

  factory SolusiOp.fromJson(Map<String, dynamic> json) {
    return SolusiOp(
      name: json['nama'],
      subCategories: SubSolusiOp.fromJsonArray(json['solusi_masalah_op']),
    );
  }
}
