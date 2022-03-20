part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<Cake> recomended;
  final List<Cake> orders;
  final String? errorMessage;

  HomeState({List<Cake>? recomended, List<Cake>? orders, this.errorMessage})
      : recomended = recomended ?? [],
        orders = orders ?? [];

  @override
  List<Object?> get props => [recomended, orders, errorMessage];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNoData extends HomeState {}

class HomeError extends HomeState {
  HomeError({List<Cake>? recomended, List<Cake>? orders, errorMessage})
      : super(
            recomended: recomended, orders: orders, errorMessage: errorMessage);
}

class HomeSuccess extends HomeState {
  HomeSuccess({required List<Cake> recomended, required List<Cake> orders})
      : super(recomended: recomended, orders: orders);
}
