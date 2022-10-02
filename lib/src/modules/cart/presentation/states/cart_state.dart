part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class FetchProductsFromCart extends CartState {
  final List<ProductEntity> _products;

  const FetchProductsFromCart(this._products);

  @override
  List<Object> get props => [_products];
}
