import 'package:flutter/material.dart';

class SnackbarService {
  static GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({String? text}) {
    final snackBar = SnackBar(
      content: Text(text ?? "Example"),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {},
      ),
      onVisible: () {},
    );
    scaffoldKey.currentState!.showSnackBar(snackBar);
  }
}
