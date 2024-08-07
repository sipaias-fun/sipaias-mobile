part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  final bool isLoading;
  const AuthState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(isLoading: false);
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(isLoading: true);
}

class AuthSuccess extends AuthState {
  const AuthSuccess() : super(isLoading: false);
}

class AuthFailure extends AuthState {
  final String error;
  final Map<String, String> validationErrors;

  const AuthFailure(this.error, this.validationErrors)
      : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading, error, validationErrors];
}
