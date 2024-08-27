import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle().copyWith(
        statusBarColor: Palette.sky1000,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Palette.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Palette.sky1000, Palette.indigo1000],
                transform: GradientRotation(45),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
