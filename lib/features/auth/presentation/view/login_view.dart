import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/buttons/i_button.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/buttons/model/button_models.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/input_text/i_textfield.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';
import 'package:sipaias_fun_mobile/cores/utils/error.dart';
import 'package:sipaias_fun_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipaias_fun_mobile/features/home/presentation/view/home_view.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/LoginView';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Palette.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Palette.sky1000, Palette.indigo1000],
              transform: GradientRotation(45),
            ),
          ),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: _contentBody(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.lg),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(
              context,
              HomeView.routeName,
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: context.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
              context.sbHeight(size: Sizes.xs),
              Text(
                'Silahkan login dengan email dan password yang terdaftar di sistem SIPAIAS FUN',
                style: context.labelMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
              context.sbHeight(size: Sizes.base),
              if (state is AuthFailure && state.error.isNotEmpty) ...[
                Text(
                  state.error,
                  style: context.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Palette.red600,
                  ),
                )
              ],
              context.sbHeight(size: Sizes.base),
              ITextField.primary(
                label: 'Username',
                labelStyle: context.labelMedium?.copyWith(
                  color: Palette.white,
                  fontWeight: FontWeight.w600,
                ),
                controller: usernameController,
                style: context.labelMedium,
                hintText: 'Masukkan username',
                hintStyle:
                    context.labelMedium?.copyWith(color: Palette.gray400),
                errorText: state is AuthFailure
                    ? getErrorText(state.validationErrors, 'username')
                    : null,
              ),
              ITextField.primary(
                label: 'Password',
                obscureText: true,
                labelStyle: context.labelMedium?.copyWith(
                  color: Palette.white,
                  fontWeight: FontWeight.w600,
                ),
                controller: passwordController,
                style: context.labelMedium,
                hintText: 'Masukkan password',
                hintStyle:
                    context.labelMedium?.copyWith(color: Palette.gray400),
                errorText: state is AuthFailure
                    ? getErrorText(state.validationErrors, 'password')
                    : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          splashRadius: 0,
                          value: value,
                          fillColor: const MaterialStatePropertyAll(
                              Palette.emerald600),
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                      ),
                      context.sbWidth(size: Sizes.sm),
                      Text(
                        'Remember Me',
                        style: context.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1,
                          color: Palette.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Lupa Password?',
                    style: context.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: Palette.amber400,
                    ),
                  ),
                ],
              ),
              IButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthLogin(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                },
                text: (state.isLoading) ? "LOADING..." : "Sign In",
                state: (state.isLoading)
                    ? ButtonState.disabled
                    : ButtonState.enabled,
                type: ButtonType.primary,
                size: ButtonSize.medium,
                foregroundColor: Colors.white,
                autoResize: false,
              ),
              context.sbHeight(size: Sizes.lg),
              GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tidak punya akun? ',
                        style: context.labelMedium?.copyWith(
                          color: Palette.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Daftar disini',
                        style: context.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Palette.amber400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              context.sbHeight(size: Sizes.sm),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Palette.neutral400,
                      height: 1,
                    ),
                  ),
                  context.sbWidth(size: Sizes.base),
                  Text(
                    'Atau',
                    style: context.labelSmall?.copyWith(
                      color: Palette.white,
                    ),
                  ),
                  context.sbWidth(size: Sizes.base),
                  Expanded(
                    child: Container(
                      color: Palette.neutral400,
                      height: 1,
                    ),
                  ),
                ],
              ),
              context.sbHeight(size: Sizes.base),
              Container(
                padding: const EdgeInsets.all(Sizes.xs),
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(Sizes.xl9),
                ),
                child: Image.asset(
                  'assets/icons/google_icon.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
