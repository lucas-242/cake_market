part of 'cake_bloc.dart';

abstract class CakeState extends Equatable {
  final List<Cake> cakes;
  final Cake? cakeSelected;
  final String? errorMessage;

  CakeState({List<Cake>? cakes, this.cakeSelected, this.errorMessage})
      : cakes = cakes ?? [];

  @override
  List<Object?> get props => [cakes, cakeSelected, errorMessage];
}

class CakeInitial extends CakeState {}

class CakeLoading extends CakeState {}

class CakeNoData extends CakeState {}

class CakeError extends CakeState {
  CakeError({List<Cake>? cakes, errorMessage})
      : super(cakes: cakes, errorMessage: errorMessage);
}

class CakeSuccess extends CakeState {
  CakeSuccess({required List<Cake> cakes}) : super(cakes: cakes);
}
