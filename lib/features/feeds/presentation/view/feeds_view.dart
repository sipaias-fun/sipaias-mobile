import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/wrapper/wrapper.dart';
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
    return Wrapper(
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
                  return _feedComponent(context, index + 1);
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feedComponent(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(Sizes.lg),
          ),
          child: Column(
            children: [
              Image.network(
                "http://localhost:3002/images/$index.jpeg",
                width: double.infinity,
                height: 85,
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
                        fontWeight: FontWeight.w200,
                        color: Palette.white,
                        letterSpacing: 1.15,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        context.sbHeight(size: context.padding3),
      ],
    );
  }
}
