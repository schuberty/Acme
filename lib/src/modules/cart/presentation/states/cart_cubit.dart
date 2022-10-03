import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Map<int, int> productsInCart = {};

  CartCubit() : super(CartInitial());

  void addProductToCart(ProductEntity product) async {
    productsInCart[product.id] = (productsInCart[product.id] ?? 0) + 1;

    emit(CartUpdated(productID: product.id, updatedAmmount: productsInCart[product.id]!));
  }

  void removeProductFromCart(ProductEntity product) {
    if (productsInCart[product.id] != null) {
      productsInCart[product.id] = productsInCart[product.id]! - 1;

      emit(CartUpdated(productID: product.id, updatedAmmount: productsInCart[product.id]!));

      if (productsInCart[product.id] == 0) {
        productsInCart.remove(product.id);
      }
    }
  }
}
