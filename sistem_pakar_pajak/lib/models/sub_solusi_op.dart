class SubSolusiOp {
  String? kodeSolusi;
  String? solusi;
  // List<String>? kondisi;

  SubSolusiOp({
    this.kodeSolusi,
    this.solusi,
    // this.kondisi,
  });

  factory SubSolusiOp.fromJson(Map<String, dynamic> json) {
    return SubSolusiOp(
      kodeSolusi: json['kode_solusi'],
      solusi: json['solusi'],
      // kondisi: (json['kondisi_jawaban'] as List)
      //     .map(
      //       (e) => e.toString(),
      //     )
      //     .toList(),
    );
  }

  static List<SubSolusiOp> fromJsonArray(List<dynamic> jsonArray) {
    List<SubSolusiOp> subCategoriesFromJson = [];
    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(SubSolusiOp.fromJson(jsonData));
    });
    return subCategoriesFromJson;
  }
}
