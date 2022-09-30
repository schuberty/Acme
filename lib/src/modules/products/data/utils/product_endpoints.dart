import 'dart:math';

class ProductEndpoints {
  ProductEndpoints._();

  static const String _picsumAPIUrl = "https://picsum.photos";
  static const String _loripsumAPIUrl = "https://loripsum.net/api";

  static String getImageUrlEndpoint({required String imageId, int imageSize = 1024}) {
    final endpoint = "$_picsumAPIUrl/seed/$imageId/$imageSize";

    return endpoint;
  }

  static String getDescriptionUrlEndpoint() {
    final pharagraphs = Random().nextInt(3) + 1;
    final pharagraphLength = Random().nextBool() ? 'short' : 'medium';

    final endpoint = "$_loripsumAPIUrl/$pharagraphs/$pharagraphLength/plaintext";

    return endpoint;
  }
}
