import 'package:collection/collection.dart';
import 'package:sistem_pakar_pajak/models/solusi_bu.dart';
import 'package:sistem_pakar_pajak/models/sub_solusi_bu.dart';
import 'package:sistem_pakar_pajak/models/subcategory_bu.dart';

class SolusiAlgoBu {
  String getSolusi(List<SolusiBu> data, String kodeLanjutan) {
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

  SubCategoryBu matchingKode(List<SubCategoryBu> data, String kodeLanjutan) {
    late SubCategoryBu subcategoryBu;
    for (int i = 0; i < data.length; i++) {
      if (data[i].kodepertanyaan == kodeLanjutan) {
        subcategoryBu = data[i];
        break;
      }
    }
    return subcategoryBu;
  }
}
