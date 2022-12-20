class SubSolusiBu {
  String? solusi;
  String? kodeSolusi;
  // List<String>? kondisi;

  SubSolusiBu({
    this.solusi,
    this.kodeSolusi,
    // this.kondisi,
  });

  factory SubSolusiBu.fromJson(Map<String, dynamic> json) {
    return SubSolusiBu(
      solusi: json['solusi'],
      kodeSolusi: json['kode_solusi'],
      // kondisi: (json['kondisi_jawaban'] as List)
      //     .map(
      //       (e) => e.toString(),
      //     )
      //     .toList(),
    );
  }

  static List<SubSolusiBu> fromJsonArray(List<dynamic> jsonArray) {
    List<SubSolusiBu> subCategoriesFromJson = [];
    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(SubSolusiBu.fromJson(jsonData));
    });
    return subCategoriesFromJson;
  }
}
