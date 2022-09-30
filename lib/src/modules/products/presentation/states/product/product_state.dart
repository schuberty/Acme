part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductAdded extends ProductState {
  final ProductEntity product;

  const ProductAdded(this.product);

  @override
  List<Object> get props => [product];
}
