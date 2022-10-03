import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_favorites_state.dart';

class ProductFavoritesCubit extends Cubit<ProductFavoritesState> {
  final Set<int> _productFavoriteIDs = {};

  Set<int> get productFavoriteIDs => _productFavoriteIDs;

  final ProductRepositoryBase _productRepository;

  ProductFavoritesCubit({required ProductRepositoryBase productRepository})
      : _productRepository = productRepository,
        super(ProductFavoritesInitial());

  void setProductFavorite(int productID, bool isProductFavorite) async {
    await _productRepository.setProductFavorite(productID, isProductFavorite);

    if (!isProductFavorite && _productFavoriteIDs.contains(productID)) {
      _productFavoriteIDs.remove(productID);
    } else {
      _productFavoriteIDs.add(productID);
    }

    emit(FavoriteProductUpdated(productID: productID, isProductFavorite: isProductFavorite));
  }

  void fetchProductFavorites() async {
    final favoriteProductsID = await _productRepository.getProductFavoritesID();

    _productFavoriteIDs.clear();
    _productFavoriteIDs.addAll(favoriteProductsID);

    emit(FavoriteProductsIDFetched(favoriteProductsID: favoriteProductsID));
  }
}
