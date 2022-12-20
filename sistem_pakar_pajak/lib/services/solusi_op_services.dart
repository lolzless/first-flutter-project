import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistem_pakar_pajak/models/solusi_op.dart';

class SolusiOpServices {
  FirebaseFirestore? _instance;

  List<SolusiOp> _categories = [];

  List<SolusiOp> getCategories() {
    return _categories;
  }

  Future<List<SolusiOp>?> getCategoriesOpfirebase() async {
    _instance = FirebaseFirestore.instance;

    List<SolusiOp> category = [];

    CollectionReference categories = _instance!.collection('solusi_masalah_op');

    DocumentSnapshot snapshot =
        await categories.doc('categories_solusi_op').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories_solusi_op'] as List<dynamic>;

    categoriesData.forEach((catData) {
      _categories.add(SolusiOp.fromJson(catData));
      category.add(SolusiOp.fromJson(catData));
    });

    return category;
  }
}
