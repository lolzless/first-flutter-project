import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/models/category.dart';

class CategoryServices {
  FirebaseFirestore? _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<List<Category>?> getCategoriesopfirebase() async {
    _instance = FirebaseFirestore.instance;

    List<Category> category = [];

    CollectionReference categories =
        _instance!.collection('pertanyaan_masalah_op');

    DocumentSnapshot snapshot = await categories.doc('categories_op').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories_op'] as List<dynamic>;

    categoriesData.forEach((catData) {
      _categories.add(Category.fromJson(catData));
      category.add(Category.fromJson(catData));
    });

    return category;
  }
}
