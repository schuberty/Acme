part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsUpdated extends ProductState {
  final List<ProductEntity> products;
  final int indexUpdated;

  const ProductsUpdated(this.products, this.indexUpdated);

  @override
  List<Object> get props => [products, indexUpdated];
}

class ProductsFetched extends ProductState {
  final List<ProductEntity> products;

  const ProductsFetched(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsCleared extends ProductState {}

class ProductLoadingError extends ProductState {}
