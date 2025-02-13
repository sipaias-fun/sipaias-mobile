part of 'init.dart';

class DioInterceptor extends Interceptor {
  // Dio dio = Dio(BaseOptions(baseUrl: "base-api-url"));
  final Dio dio;
  DioInterceptor(this.dio);

  String get getAuthToken {
    return StorageReferences.getAuthToken();
  }

  LoaderManager get loaderManager =>
      LoaderManager(NavigationService.navigatorKey);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $getAuthToken",
    });

    loaderManager.show();
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    await Future.delayed(const Duration(seconds: 5));
    loaderManager.hide();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized.
    if (err.response?.statusCode == 401) {
      // Refresh the user's authentication token.
      await refreshToken();
      // Retry the request.
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        // If the request fails again, pass the error to the next interceptor in the chain.
        handler.next(e);
      }
      // Return to prevent the next interceptor in the chain from being executed.
      return;
    }
    // Pass the error to the next interceptor in the chain.
    loaderManager.hide();
    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post('http:/refresh-token',
        options: Options(headers: {"Refresh-Token": "refresh-token"}));
    // on success response, deserialize the response
    if (response.statusCode == 200) {
      // LoginRequestResponse requestResponse =
      //    LoginRequestResponse.fromJson(response.data);
      // UPDATE the STORAGE with new access and refresh-tokens
      return response;
    }

    return response;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer $getAuthToken",
      },
    );

    // Retry the request with the new `RequestOptions` object.
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
