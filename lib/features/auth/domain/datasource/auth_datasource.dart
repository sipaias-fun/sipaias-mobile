import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';

abstract class AuthDatasource {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse?> refreshToken();
}
