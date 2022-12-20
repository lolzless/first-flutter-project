import 'package:collection/collection.dart';
import 'package:sistem_pakar_pajak/models/solusi_op.dart';
import 'package:sistem_pakar_pajak/models/sub_solusi_op.dart';
import 'package:sistem_pakar_pajak/models/subcategory.dart';

class SolusiAlgo {
  // String getJawabanWithForwardChaining(
  //     {required List<String> kodeHasilJawaban,
  //     required List<SubSolusiOp> dataSolusi}) {
  //   int length = kodeHasilJawaban.length;
  //   String jawaban = "";
  //   int totalData = dataSolusi.length;
  //   for (int i = 0; i < totalData; i++) {
  //     if (const IterableEquality()
  //         .equals(kodeHasilJawaban, dataSolusi[i].kondisi)) {
  //       jawaban = dataSolusi[i].solusi!;
  //       break;
  //     } else {
  //       jawaban = "Anda Tidak Memiliki Masalah di Topik ini";
  //     }
  //   }

  //   return jawaban;
  // }

  String getSolusi(List<SolusiOp> data, String kodeLanjutan) {
    String hasil = "";
    for (int i = 0; i < data.length; i++) {
      data[i].subCategories!.where((element) {
        if (element.kodeSolusi == kodeLanjutan) {
          hasil = element.solusi!;
          return true;
        }
        return false;
      }).toList();
    }
    return hasil;
  }

  SubCategory matchingKode(List<SubCategory> data, String kodeLanjutan) {
    late SubCategory subcategoryOp;

    for (int i = 0; i < data.length; i++) {
      if (data[i].kodepertanyaan == kodeLanjutan) {
        subcategoryOp = data[i];
        break;
      }
    }
    return subcategoryOp;
  }
}
