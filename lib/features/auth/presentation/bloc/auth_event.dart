part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String username;
  final String password;

  const AuthSignUp({
    required this.name,
    required this.username,
    required this.password,
  });
}

final class AuthLogin extends AuthEvent {
  final String username;
  final String password;

  const AuthLogin({
    required this.username,
    required this.password,
  });
}
