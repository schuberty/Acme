part of 'product_favorites_cubit.dart';

abstract class ProductFavoritesState extends Equatable {
  const ProductFavoritesState();

  @override
  List<Object> get props => [];
}

class ProductFavoritesInitial extends ProductFavoritesState {}

class FavoriteProductUpdated extends ProductFavoritesState {
  final int productID;
  final bool isProductFavorite;

  const FavoriteProductUpdated({
    required this.productID,
    required this.isProductFavorite,
  });

  @override
  List<Object> get props => [productID, isProductFavorite];
}

class FavoriteProductsIDFetched extends ProductFavoritesState {
  final List<int> favoriteProductsID;

  const FavoriteProductsIDFetched({required this.favoriteProductsID});

  @override
  List<Object> get props => [favoriteProductsID];
}
