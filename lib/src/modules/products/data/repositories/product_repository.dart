import 'dart:async';
import 'dart:math';

import 'package:acme/src/modules/products/data/utils/product_endpoints.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:acme/src/shared/modules/http_client/domain/services/http_client_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository implements ProductRepositoryBase {
  final HttpClientServiceBase _client;

  ProductRepository({required HttpClientServiceBase client}) : _client = client;

  @override
  Stream<ProductEntity> fetchProducts() async* {
    final favoriteProductsID = await getProductFavoritesID();

    for (var i = 0; i < max(verbList.length, adjectiveList.length); i++) {
      final title = "${verbList[i]} ${adjectiveList[i]}";
      final id = title.hashCode;

      final descriptionEndpoint = ProductEndpoints.getDescriptionUrlEndpoint();
      final descriptionResponse = await _client.get(descriptionEndpoint) as String;

      final imageEndpoint = ProductEndpoints.getImageUrlEndpoint(imageId: id.toString());

      final price = ((id * (i + 1.0)) % 299) + ((id % 100) * 0.01);

      final product = ProductEntity(
        id: id,
        title: title,
        description: descriptionResponse,
        imageUrl: imageEndpoint,
        price: price,
        isFavorite: favoriteProductsID.contains(id),
      );

      yield product;
    }
  }

  @override
  Future<void> setProductFavorite(int productID, bool isProductFavorite) async {
    final preferences = await SharedPreferences.getInstance();
    final favoriteProductsID = await getProductFavoritesID();

    if (isProductFavorite) {
      favoriteProductsID.add(productID);
    } else {
      favoriteProductsID.removeWhere((productID) => productID == productID);
    }

    final favoriteProductsIDString = favoriteProductsID
        .map(
          (product) => product.toString(),
        )
        .toList();

    await preferences.setStringList("favorite_products", favoriteProductsIDString);
  }

  @override
  Future<List<int>> getProductFavoritesID() async {
    final favoriteProductsID = <int>[];

    final preferences = await SharedPreferences.getInstance();

    final favoriteProductsIDString = preferences.getStringList('favorite_products');

    if (favoriteProductsIDString != null) {
      for (var productID in favoriteProductsIDString) {
        favoriteProductsID.add(int.parse(productID));
      }
    }

    return favoriteProductsID;
  }

  static const List<String> verbList = <String>[
    "Arm??rio",
    "Navio",
    "Mala",
    "Base",
    "Hidroavi??o",
    "Revista",
    "Carretel",
    "Minissaia",
    "Tamborim",
    "Andador",
    "Geladeira",
    "Est??tua",
    "Rolo",
    "Crach??",
    "Peneira",
    "Baf??metro",
    "Desentupidor",
    "Guarda-chuva",
    "Espanador",
    "Escudo",
    "Raquete",
    "Vaso sanit??rio",
    "Lancheira",
    "Cofre",
    "Heli??stato",
    "Medalha",
    "Foguete",
    "Lata",
    "Sintetizador",
    "Grampo",
    "Bucha",
    "Catraca",
    "Alfinete",
    "Caneca",
    "Fita",
    "Moeda",
    "Gel",
    "Maquete",
    "Interfone",
    "Gaveta",
    "Helic??ptero",
    "Vela de cera",
    "Quimono",
    "Bambol??",
    "Necessaire",
    "Machado",
    "Tecido",
    "Vareta de freio",
    "Obra de arte",
    "Canga"
  ];

  static const List<String> adjectiveList = [
    "prepotente",
    "valioso",
    "leg??timo",
    "desleixado",
    "natural",
    "inteligente",
    "disciplinado",
    "louv??vel",
    "amargurado",
    "honesto",
    "odioso",
    "vergonhoso",
    "horroroso",
    "magn??fico",
    "gordo",
    "rom??ntico",
    "sublime",
    "mesquinho",
    "injusto",
    "medroso",
    "ot??rio",
    "quente",
    "intenso",
    "S??bio",
    "zeloso",
    "desapegado",
    "faceiro",
    "companheiro",
    "empenhado",
    "espantoso",
    "traidor",
    "perfeccionista",
    "qualificado",
    "feio",
    "tolerante",
    "orgulhoso",
    "ignorante",
    "lutador",
    "desejado",
    "exigente",
    "nost??lgico",
    "pr??spero",
    "compreensivo",
    "excelente",
    "estourado",
    "malvado",
    "windsurfista",
    "verdadeiro",
    "melhor",
    "terno"
  ];
}
