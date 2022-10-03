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

  String toJsonString() {
    return '''
    "id": $id,
    "title": "$title",
    "description": "${description.substring(0, description.length ~/ 10)}...",
    "imageUrl": "$imageUrl",
    "isFavorite": $isFavorite,
    "price": $price''';
  }
}
