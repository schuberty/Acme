import 'package:acme/src/modules/products/product_module.dart';
import 'package:acme/src/shared/modules/shared_modules.dart';
import 'package:provider/provider.dart';

final appModules = <Provider>[
  ...sharedModules,
  ...productModules,
];
