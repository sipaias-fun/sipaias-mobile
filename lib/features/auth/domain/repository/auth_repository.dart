import 'package:fpdart/fpdart.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  });
  Future<Either<Failure, LoginResponse>?> refreshToken();
}
