class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isFavorite;
  final double price;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.price = 0.0,
  });
}
