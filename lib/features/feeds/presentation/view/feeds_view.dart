import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class FeedsView extends StatefulWidget {
  static const routeName = '/FeedsView';

  const FeedsView({super.key});

  @override
  State<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle().copyWith(
        statusBarColor: Palette.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Palette.sky1000, Palette.indigo1000],
                transform: GradientRotation(45),
              ),
            ),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.lg),
                    child: Text(
                      "Feeds",
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Palette.white,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.lg),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          children: [
                            _feedComponent(context),
                            const SizedBox(height: 16), // Add gap between items
                          ],
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _feedComponent(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
      ),
      child: Column(
        children: [
          Image.network(
            "https://picsum.photos/500/450",
            width: double.infinity,
            height: 125,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(context.padding2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exploring the Wonders of Nature: A Journey',
                  style: context.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Palette.white,
                  ),
                ),
                context.sbHeight(size: context.padding1),
                Text(
                  'This card delves into the beautiful landscapes and diverse wildlife that nature has to offer, providing insights and stunning visuals.',
                  style: context.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Palette.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
