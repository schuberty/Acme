import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:provider/provider.dart';

final cartModules = <Provider>[
  Provider<CartCubit>(
    create: (context) => CartCubit(context.read<ProductRepositoryBase>()),
  ),
];
