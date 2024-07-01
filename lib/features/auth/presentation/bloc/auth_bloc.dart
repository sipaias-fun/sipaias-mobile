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
    debugPrint("${event.username} ${event.password}");
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    // Perform input validation
    Map<String, String> errors = _validateInput(event.username, event.password);

    debugPrint(errors.toString());

    if (errors.isNotEmpty) {
      emit(AuthValidationError(errors));
      return;
    }

    final res = await _userSignIn(LoginRequest(
      username: event.username,
      password: event.password,
    ));

    res.fold(
      (l) {
        debugPrint(l.code);
        if (l.code == '404') {
          emit(const AuthFailure("Username or password is wrong"));
          return;
        }
        emit(AuthFailure(l.message));
      },
      (r) {
        emit(AuthSuccess());
      },
    );
  }

  Map<String, String> _validateInput(String username, String password) {
    Map<String, String> errors = {};
    if (username.isEmpty) {
      errors['username'] = 'Username is required';
    }
    if (password.isEmpty) {
      errors['password'] = 'Password is required';
    }
    return errors;
  }
}
