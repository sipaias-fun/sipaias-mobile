import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class ProfileView extends StatefulWidget {
  static const routeName = '/ProfileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
      child: Center(
        child: Text(
          "Profile VIEW",
          style: context.labelSmall?.copyWith(
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}
