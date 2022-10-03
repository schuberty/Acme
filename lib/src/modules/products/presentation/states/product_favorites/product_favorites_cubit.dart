import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_favorites_state.dart';

class ProductFavoritesCubit extends Cubit<ProductFavoritesState> {
  final Set<int> productFavoriteIDs = {};

  final ProductRepositoryBase _productRepository;

  ProductFavoritesCubit({required ProductRepositoryBase productRepository})
      : _productRepository = productRepository,
        super(ProductFavoritesInitial());

  void setProductFavorite(int productID, bool isProductFavorite) async {
    await _productRepository.setProductFavorite(productID, isProductFavorite);

    if (!isProductFavorite && productFavoriteIDs.contains(productID)) {
      productFavoriteIDs.remove(productID);
    } else {
      productFavoriteIDs.add(productID);
    }

    emit(FavoriteProductUpdated(productID: productID, isProductFavorite: isProductFavorite));
  }

  void fetchProductFavorites() async {
    final favoriteProductsID = await _productRepository.getProductFavoritesID();

    productFavoriteIDs.clear();
    productFavoriteIDs.addAll(favoriteProductsID);

    emit(FavoriteProductsIDFetched(favoriteProductsID: favoriteProductsID));
  }
}
