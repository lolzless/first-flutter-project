class KondisiBu {
  bool? isEnd;
  String? kodeLanjutan;
  KondisiBu({
    this.isEnd,
    this.kodeLanjutan,
  });

  factory KondisiBu.fromJson(Map<String, dynamic> json) {
    return KondisiBu(
      isEnd: json['is_end'],
      kodeLanjutan: json['kode_lanjutan'],
    );
  }
}
