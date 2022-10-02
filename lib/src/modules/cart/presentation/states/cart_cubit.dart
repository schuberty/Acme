import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final ProductRepositoryBase _productRepository;

  final List<ProductEntity> _products = <ProductEntity>[];

  CartCubit(ProductRepositoryBase productRepository)
      : _productRepository = productRepository,
        super(CartInitial());

  void addProductToCart(ProductEntity product) {
    _products.add(product);
  }

  void removeProductFromCart(ProductEntity product) {
    _products.remove(product);
  }
}
