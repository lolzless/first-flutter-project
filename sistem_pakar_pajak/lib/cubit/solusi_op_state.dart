part of 'solusi_op_cubit.dart';

abstract class SolusiOpState extends Equatable {
  const SolusiOpState();

  @override
  List<Object> get props => [];
}

class SolusiOpInitial extends SolusiOpState {}

class SolusiOpLoading extends SolusiOpState {}

class SolusiOpFailed extends SolusiOpState {
  final String error;
  SolusiOpFailed(this.error);
}

class SolusiOpSuccess extends SolusiOpState {
  final List<SolusiOp>? solusiOp;

  SolusiOpSuccess(this.solusiOp);
}
