import 'package:acme/src/modules/products/data/repositories/product_repository.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/modules/http_client/domain/services/http_client_service.dart';
import 'package:provider/provider.dart';

final productModules = <Provider>[
  Provider<ProductRepositoryBase>(
    create: (context) => ProductRepository(
      client: context.read<HttpClientServiceBase>(),
    ),
  ),
  Provider<ProductBloc>(
    create: (context) => ProductBloc(
      productRepository: context.read<ProductRepositoryBase>(),
    ),
  )
];
