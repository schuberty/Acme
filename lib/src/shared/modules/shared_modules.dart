import 'package:acme/src/shared/modules/http_client/data/services/client_service.dart';
import 'package:acme/src/shared/modules/http_client/domain/services/http_client_service.dart';
import 'package:provider/provider.dart';

final sharedModules = <Provider>[
  Provider<HttpClientServiceBase>(
    create: (context) => ClientService(),
  ),
];
