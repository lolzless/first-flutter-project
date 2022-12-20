import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sistem_pakar_pajak/models/solusi_op.dart';
import 'package:sistem_pakar_pajak/services/solusi_op_services.dart';

part 'solusi_op_state.dart';

class SolusiOpCubit extends Cubit<SolusiOpState> {
  SolusiOpCubit() : super(SolusiOpInitial());

  void getDataCategory() async {
    try {
      emit(SolusiOpLoading());
      List<SolusiOp>? categoryOp =
          await SolusiOpServices().getCategoriesOpfirebase();
      emit(SolusiOpSuccess(categoryOp));
      debugPrint(categoryOp.toString());
    } catch (e) {
      emit(SolusiOpFailed(e.toString()));
    }
  }
}
