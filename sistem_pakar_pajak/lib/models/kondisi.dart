class Kondisi {
  bool? isEnd;
  String? kodeLanjutan;
  Kondisi({
    this.isEnd,
    this.kodeLanjutan,
  });

  factory Kondisi.fromJson(Map<String, dynamic> json) {
    return Kondisi(
      isEnd: json['is_end'],
      kodeLanjutan: json['kode_lanjutan'],
    );
  }
}
