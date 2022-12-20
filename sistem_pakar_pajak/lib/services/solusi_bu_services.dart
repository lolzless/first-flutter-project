import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistem_pakar_pajak/models/solusi_bu.dart';

class SolusiBuServices {
  FirebaseFirestore? _instance;

  List<SolusiBu> _categories = [];

  List<SolusiBu> getCategories() {
    return _categories;
  }

  Future<List<SolusiBu>?> getCategoriesBufirebase() async {
    _instance = FirebaseFirestore.instance;

    List<SolusiBu> category = [];

    CollectionReference categories =
        _instance!.collection('solusi_masalah_badan_usaha');

    DocumentSnapshot snapshot =
        await categories.doc('categories_solusi_bu').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories_solusi_bu'] as List<dynamic>;

    categoriesData.forEach((catData) {
      _categories.add(SolusiBu.fromJson(catData));
      category.add(SolusiBu.fromJson(catData));
    });

    return category;
  }
}
