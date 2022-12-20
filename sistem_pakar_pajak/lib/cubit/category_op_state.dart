part of 'category_op_cubit.dart';

abstract class CategoryOpState extends Equatable {
  const CategoryOpState();

  @override
  List<Object> get props => [];
}

class CategoryOpInitial extends CategoryOpState {}

class CategoryOpLoading extends CategoryOpState {}

class CategoryOpFailed extends CategoryOpState {
  final String error;
  CategoryOpFailed(this.error);
}

class CategoryOpSuccess extends CategoryOpState {
  final List<Category>? categoryOp;

  CategoryOpSuccess(this.categoryOp);
}
