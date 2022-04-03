part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<Product> products;
  final Product? productSelected;
  final String? errorMessage;

  ProductState(
      {List<Product>? products, this.productSelected, this.errorMessage})
      : products = products ?? [];

  @override
  List<Object?> get props => [products, productSelected, errorMessage];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductNoData extends ProductState {}

class ProductError extends ProductState {
  ProductError({List<Product>? products, errorMessage})
      : super(products: products, errorMessage: errorMessage);
}

class ProductSuccess extends ProductState {
  ProductSuccess({required List<Product> products}) : super(products: products);
}
