part of 'solusi_bu_cubit.dart';

abstract class SolusiBuState extends Equatable {
  const SolusiBuState();

  @override
  List<Object> get props => [];
}

class SolusiBuInitial extends SolusiBuState {}

class SolusiBuLoading extends SolusiBuState {}

class SolusiBuFailed extends SolusiBuState {
  final String error;
  SolusiBuFailed(this.error);
}

class SolusiBuSuccess extends SolusiBuState {
  final List<SolusiBu>? solusiBu;

  SolusiBuSuccess(this.solusiBu);
}
