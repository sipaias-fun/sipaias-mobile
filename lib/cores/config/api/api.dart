part of 'init.dart';

class ApiClient {
  Dio init({String baseUrl = 'http://185.199.52.27:3001/api/v1'}) {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType = 'application/json';
    dio.options.headers = authorizationHeader.headers;
    dio.interceptors.add(DioInterceptor(dio));
    return dio;
  }

  Options get authorizationHeader {
    String accessToken = StorageReferences.getAuthToken();
    return Options(headers: {
      "Authorization": "Bearer $accessToken",
      "accept": "application/json"
    });
  }
}
