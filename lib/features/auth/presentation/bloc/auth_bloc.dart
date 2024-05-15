import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipaias_fun_mobile/cores/domain/auth/login_request.dart';
import 'package:sipaias_fun_mobile/features/auth/domain/usecases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignIn userSignIn})
      : _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint("${event.email} ${event.password}");
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignIn(LoginRequest(
      email: event.email,
      password: event.password,
    ));

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess()),
    );
  }
}
