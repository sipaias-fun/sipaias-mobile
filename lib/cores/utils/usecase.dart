import 'package:fpdart/fpdart.dart';
import 'package:sipaias_fun_mobile/cores/domain/errors/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>?> call(Params params);
}
