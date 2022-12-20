part of 'category_bu_cubit.dart';

abstract class CategoryBuState extends Equatable {
  const CategoryBuState();

  @override
  List<Object> get props => [];
}

class CategoryBuInitial extends CategoryBuState {}

class CategoryBuLoading extends CategoryBuState {}

class CategoryBuFailed extends CategoryBuState {
  final String error;
  CategoryBuFailed(this.error);
}

class CategoryBuSuccess extends CategoryBuState {
  final List<CategoryBu>? categoryBu;

  CategoryBuSuccess(this.categoryBu);
}
