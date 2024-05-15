import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/exception.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/datasource/auth_datasource.dart';

class AuthDataSourceImpl implements AuthDatasource {
  final Dio apiClient;
  AuthDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      debugPrint(loginRequest.toJson().toString());
      return LoginResponse(
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
          expiredToken: 100);
    } catch (e) {
      return throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<LoginResponse?> refreshToken() async {
    return null;
  }
}
