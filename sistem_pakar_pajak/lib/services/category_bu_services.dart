import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistem_pakar_pajak/models/category_bu.dart';

class CategoryBuServices {
  FirebaseFirestore? _instance;

  List<CategoryBu> _categories = [];

  List<CategoryBu> getCategories() {
    return _categories;
  }

  Future<List<CategoryBu>?> getCategoriesbufirebase() async {
    _instance = FirebaseFirestore.instance;

    List<CategoryBu> category = [];

    CollectionReference categories =
        _instance!.collection('pertanyaan_masalah_badan_usaha');

    DocumentSnapshot snapshot = await categories.doc('categories_bu').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories_bu'] as List<dynamic>;

    categoriesData.forEach((catData) {
      _categories.add(CategoryBu.fromJson(catData));
      category.add(CategoryBu.fromJson(catData));
    });

    return category;
  }
}
