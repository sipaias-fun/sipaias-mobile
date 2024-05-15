import 'package:fpdart/fpdart.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/cores/domain/domain.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/failure.dart';
import 'package:sipaias_fun_mobile/cores/utils/usecase.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/repository/auth_repository.dart';

class UserSignIn implements UseCase<LoginResponse, LoginRequest> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest loginRequest) async {
    return await authRepository.login(loginRequest: loginRequest);
  }
}
