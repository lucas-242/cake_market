part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<Product> recomended;
  final List<Product> orders;
  final String? errorMessage;

  HomeState(
      {List<Product>? recomended, List<Product>? orders, this.errorMessage})
      : recomended = recomended ?? [],
        orders = orders ?? [];

  @override
  List<Object?> get props => [recomended, orders, errorMessage];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNoData extends HomeState {}

class HomeRefresh extends HomeState {}

class HomeError extends HomeState {
  HomeError({List<Product>? recomended, List<Product>? orders, errorMessage})
      : super(
            recomended: recomended, orders: orders, errorMessage: errorMessage);
}

class HomeSuccess extends HomeState {
  HomeSuccess(
      {required List<Product> recomended, required List<Product> orders})
      : super(recomended: recomended, orders: orders);
}
