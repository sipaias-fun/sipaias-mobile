import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/wrapper/wrapper.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class DashboardView extends StatefulWidget {
  static const routeName = '/DashboardView';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
        child: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: _contentBody(context),
        ),
      ],
    ));
  }

  Widget _contentBody(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Sizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Palette.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
