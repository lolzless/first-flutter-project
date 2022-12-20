import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/models/category_bu.dart';
import 'package:sistem_pakar_pajak/services/category_bu_services.dart';

part 'category_bu_state.dart';

class CategoryBuCubit extends Cubit<CategoryBuState> {
  CategoryBuCubit() : super(CategoryBuInitial());

  void getDataCategory() async {
    try {
      emit(CategoryBuLoading());
      List<CategoryBu>? categoryBu =
          await CategoryBuServices().getCategoriesbufirebase();
      emit(CategoryBuSuccess(categoryBu));
      debugPrint(categoryBu.toString());
    } catch (e) {
      emit(CategoryBuFailed(e.toString()));
    }
  }
}
