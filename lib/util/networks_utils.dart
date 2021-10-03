import 'package:dio/dio.dart';
import 'package:moviedb/repositories/retrofit/api_client.dart';

class NetworkUtils {
  static ApiClient defaultApiClient() =>
      ApiClient(Dio(BaseOptions(contentType: "application/json")));

  //TODO add mock api client for unit tests
  static ApiClient mockApiClient() => defaultApiClient();
}
