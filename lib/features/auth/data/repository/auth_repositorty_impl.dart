import 'package:fpdart/fpdart.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/exception.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/failure.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/datasource/auth_datasource.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest}) async {
    try {
      final response = await authDatasource.login(loginRequest);
      return right(response.data);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message, e.code!));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>?> refreshToken() async {
    return null;
  }
}
