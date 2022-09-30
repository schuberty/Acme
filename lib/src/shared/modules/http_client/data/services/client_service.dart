import 'package:acme/src/shared/modules/http_client/data/erros/client_error.dart';
import 'package:acme/src/shared/modules/http_client/domain/services/http_client_service.dart';
import 'package:dio/dio.dart';

class ClientService implements HttpClientServiceBase {
  late final Dio _client;

  ClientService({Dio? dio}) {
    final baseOptions = BaseOptions(connectTimeout: 6000);

    _client = dio ?? Dio(baseOptions);
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryData}) async {
    late final Response response;

    try {
      response = await _client.get(path, queryParameters: queryData);
    } on DioError {
      throw ClientError();
    }

    return response.data;
  }
}
