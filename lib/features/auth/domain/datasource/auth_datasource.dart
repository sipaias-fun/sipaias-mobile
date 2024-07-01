import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/base/base_response_entity.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';

abstract class AuthDatasource {
  Future<BaseResponseEntity<LoginResponse>> login(LoginRequest request);
  Future<BaseResponseEntity<LoginResponse>?> refreshToken();
}
