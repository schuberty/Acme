import 'package:acme/src/modules/products/domain/entities/product_entity.dart';

extension ProductExtension on ProductEntity {
  ProductEntity copyWith({bool? isFavorite}) {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      price: price,
    );
  }
}
