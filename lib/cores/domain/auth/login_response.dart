part of '../domain.dart';

class LoginResponse {
  String accessToken;
  String refreshToken;
  int expiredToken;

  LoginResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiredToken});
}
