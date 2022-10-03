import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  CartCubit() : super(CartInitial());

  void addProductToCart(ProductEntity product) async {
    _cart[product.id] = (_cart[product.id] ?? 0) + 1;

    emit(CartUpdated(productID: product.id, updatedAmmount: _cart[product.id]!));
  }

  void removeProductFromCart(ProductEntity product) {
    if (_cart[product.id] != null) {
      _cart[product.id] = _cart[product.id]! - 1;

      emit(CartUpdated(productID: product.id, updatedAmmount: _cart[product.id]!));

      if (_cart[product.id] == 0) {
        _cart.remove(product.id);
      }
    }
  }

  void clearProductsFromCart() {
    _cart.clear();

    emit(CartCleared());
  }
}
