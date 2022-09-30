abstract class HttpClientServiceBase {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryData,
  });
}
