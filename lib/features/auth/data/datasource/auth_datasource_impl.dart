import 'package:dio/dio.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/base/base_response_model.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/exception.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/datasource/auth_datasource.dart';

class AuthDataSourceImpl implements AuthDatasource {
  final Dio apiClient;
  AuthDataSourceImpl(this.apiClient);

  @override
  Future<BaseResponseModel<LoginResponse>> login(
      LoginRequest loginRequest) async {
    try {
      var response =
          await apiClient.post('/auth/login', data: loginRequest.toJson());
      return BaseResponseModel.fromJson(
        response: response.data,
        onResult: ((json) {
          return LoginResponse.fromJson(json);
        }),
      );
    } on DioException catch (e) {
      return throw ServerExceptions(
          message: e.toString(), code: e.response!.statusCode.toString());
    } catch (e) {
      return throw ServerExceptions(
        message: e.toString(),
      );
    }
  }

  @override
  Future<BaseResponseModel<LoginResponse>?> refreshToken() async {
    return null;
  }
}
