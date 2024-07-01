part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);
}

final class AuthValidationError extends AuthState {
  final Map<String, String> validationErrors;

  const AuthValidationError(this.validationErrors);

  @override
  List<Object> get props => [validationErrors];
}
