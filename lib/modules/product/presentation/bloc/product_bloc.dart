import 'package:bloc/bloc.dart';
import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts;

  ProductBloc({required GetProducts getProducts})
      : _getProducts = getProducts,
        super(ProductInitial());
}
