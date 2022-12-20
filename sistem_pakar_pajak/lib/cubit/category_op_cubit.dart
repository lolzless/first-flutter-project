import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/services/category_op_services.dart';
import 'package:sistem_pakar_pajak/ui/pages/category_masalah_op_page.dart';

part 'category_op_state.dart';

class CategoryOpCubit extends Cubit<CategoryOpState> {
  CategoryOpCubit() : super(CategoryOpInitial());

  void getDataCategory() async {
    try {
      emit(CategoryOpLoading());
      List<Category>? categoryOp =
          await CategoryServices().getCategoriesopfirebase();
      emit(CategoryOpSuccess(categoryOp));
      debugPrint(categoryOp.toString());
    } catch (e) {
      emit(CategoryOpFailed(e.toString()));
    }
  }
}
