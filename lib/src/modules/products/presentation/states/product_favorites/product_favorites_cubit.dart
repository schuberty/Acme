import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_favorites_state.dart';

class ProductFavoritesCubit extends Cubit<ProductFavoritesState> {
  final ProductRepositoryBase _productRepository;

  ProductFavoritesCubit({required ProductRepositoryBase productRepository})
      : _productRepository = productRepository,
        super(ProductFavoritesInitial());

  void setProductFavorite(int productID, bool isProductFavorite) async {
    await _productRepository.setProductFavorite(productID, isProductFavorite);

    emit(FavoriteProductUpdated(productID: productID, isProductFavorite: isProductFavorite));
  }
}
