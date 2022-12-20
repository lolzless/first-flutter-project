import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sistem_pakar_pajak/models/solusi_bu.dart';
import 'package:sistem_pakar_pajak/services/solusi_bu_services.dart';

part 'solusi_bu_state.dart';

class SolusiBuCubit extends Cubit<SolusiBuState> {
  SolusiBuCubit() : super(SolusiBuInitial());

  void getDataCategory() async {
    try {
      emit(SolusiBuLoading());
      List<SolusiBu>? categoryBu =
          await SolusiBuServices().getCategoriesBufirebase();
      emit(SolusiBuSuccess(categoryBu));
      debugPrint(categoryBu.toString());
    } catch (e) {
      emit(SolusiBuFailed(e.toString()));
    }
  }
}
