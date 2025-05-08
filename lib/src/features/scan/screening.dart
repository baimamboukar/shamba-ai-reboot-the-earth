import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/app/assets.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/extensions/widgetx.dart';
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart';
import 'package:shamba/src/features/scan/presentation/widgets/recent_checkups.dart';
import 'package:shamba/src/features/scan/presentation/widgets/scan_stats.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class ScreeningPage extends StatefulWidget {
  const ScreeningPage({required this.farm, super.key});
  final FarmData farm;

  @override
  State<ScreeningPage> createState() => _ScreeningPageState();
}

class _ScreeningPageState extends State<ScreeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // leading: SizedBox.shrink(),
            expandedHeight: 224,
            flexibleSpace: SliverAppBarContent(),
          ),
          SliverToBoxAdapter(
            child: 24.vGap,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 34,
              width: 234,
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  JobsenseTab(title: 'Overview', index: 0),
                  JobsenseTab(title: 'Weather', index: 1),
                  JobsenseTab(title: 'Risks Analysis', index: 2),
                ],
              ),
            ).hPaddingx(28),
          ),
          SliverToBoxAdapter(
            child: 18.vGap,
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: descIndex,
              builder: (context, index, _) {
                return IndexedStack(
                  index: index,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecentChekups(
                          farmData: widget.farm,
                        ),
                        14.vGap,
                        const SoilChemics().hPadding.vPadding,
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CallAction(
                        //       icon: Hicons.activity_1_bold,
                        //       label: "Dashboard",
                        //     ),
                        //     CallAction(
                        //       icon: HeroIcons.cloud,
                        //       label: "Weather",
                        //     ),
                        //     CallAction(
                        //       icon: HeroIcons.shieldExclamation,
                        //       label: "Alerts",
                        //     ),
                        //     CallAction(
                        //       icon: HeroIcons.arrowPath,
                        //       label: "Connect",
                        //     ),
                        //   ],
                        // ),
                        WeatherBox(),
                        WeatherBox(),
                        WeatherBox(), WeatherBox(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SoilChemics().hPadding.vPadding,
                      ],
                    ),
                  ],
                ).hPadding;
              },
            ),
          ),
          SliverToBoxAdapter(
            child: 24.vGap,
          ),
        ],
      ),
    );
  }
}

class WeatherBox extends StatelessWidget {
  const WeatherBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: context.width,
      decoration: BoxDecoration(
        color: context.scheme.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IRAD Road Farm',
                    style: context.typography.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: context.scheme.onPrimary,
                    ),
                  ),
                  Text(
                    'Today',
                    style: context.typography.bodyLarge!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: context.scheme.onPrimary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              HeroIcon(
                HeroIcons.sun,
                size: 74,
                color: context.scheme.onPrimary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sunny',
                style: context.typography.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: context.scheme.onPrimary,
                ),
              ),
              Text(
                '16 C',
                style: context.typography.bodyLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: context.scheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ).hPadding.vPaddingx(10).floatL,
    ).vPaddingx(8);
  }
}

class SoilChemics extends StatelessWidget {
  const SoilChemics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: context.scheme.onPrimary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: SfCartesianChart(
        isTransposed: true,
        primaryXAxis: const CategoryAxis(), // Hide X-axis
        primaryYAxis: const NumericAxis(
          labelFormat: '{value}%', // Add "%" to Y-axis labels
        ),
        series: [
          BarSeries<SoilNutrient, String>(
            width: .4, // Reduce bar width
            color: context.scheme.primary.withOpacity(0.5),
            dataSource: _nutrients,
            xValueMapper: (nutrient, _) => nutrient.name,
            yValueMapper: (nutrient, _) => nutrient.value,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            //  isStacked: true, // Stack bars for comparison
            // trackBackgroundColor: Colors.grey.shade200, // Set track color
          ),
        ],
      ).hPadding.vPadding,
    );
  }
}

class DescTabIndex extends ValueNotifier<int> {
  DescTabIndex() : super(0);

  // ignore: avoid_setters_without_getters
  set setIndex(int index) {
    value = index;
  }

  int get getIndex => value;
}

final descIndex = DescTabIndex();

class JobsenseTab extends StatelessWidget {
  const JobsenseTab({
    required this.title,
    required this.index,
    super.key,
  });
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: descIndex,
      builder: (context, activeIndex, _) {
        return GestureDetector(
          onTap: () {
            descIndex.setIndex = index;
          },
          child: Container(
            height: 34,
            width: 100,
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text(title)),
          ),
        );
      },
    );
  }
}

class _DescSection extends StatelessWidget {
  const _DescSection({
    required this.title,
    this.contentWidget,
    this.content,
    this.contentList,
  });
  final String title;
  final String? content;
  final Widget? contentWidget;
  final List<String>? contentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        14.vGap,
        Row(
          children: [
            Text(
              title,
              style: context.typography.bodyLarge!.copyWith(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        14.vGap,
        Visibility(
          visible: content != null && contentList == null,
          replacement: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (contentList ?? <String>[])
                .map(
                  (item) => Text(
                    '• $item',
                    style: context.typography.labelLarge,
                  ).vPaddingx(3.5),
                )
                .toList(),
          ).hPadding,
          child: contentWidget ??
              Text(
                content.toString(),
                style: context.typography.labelMedium,
              ),
        ),
      ],
    );
  }
}

class SliverAppBarContent extends StatelessWidget {
  const SliverAppBarContent({super.key});
  //final Job job;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SizedBox(
        width: double.infinity,
        height: 224,
        child: ClipPath(
          clipper: TrapezoidalClipper(),
          child: ColoredBox(
            color: context.colorScheme.primary,
            child: const ContentWidget(),
          ),
        ),
      ),
    );
  }
}

class TrapezoidalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
        size.width / 4,
        size.height,
        size.width / 2,
        size.height,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height,
        size.width,
        size.height - 20,
      )
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});
  // final Farm job;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        14.vGap,
        CircleAvatar(
          backgroundColor: context.colorScheme.onPrimary,
          radius: 32,
          backgroundImage: const AssetImage(Assets.assetsIconsWoman),
        ),
        8.vGap,
        Text(
          'Farm IRAD Road',
          style: context.typography.bodyLarge!
              .copyWith(color: context.colorScheme.onPrimary, fontSize: 24),
        ),
        Text(
          'IRAD ROAD FARM',
          style: context.typography.bodyLarge,
        ),
        8.vGap,
        // Wrap(
        //   spacing: 8,
        //   children: job.tags.map((tag) => Slug(content: tag)).toList(),
        // ),
        14.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '1200 Tonnes',
              //'${job.location.city} • ${job.location.country}',
              style: context.typography.bodyLarge,
            ),
            Text(
              '500 m^2',
              style: context.typography.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

final List<SoilNutrient> _nutrients = [
  SoilNutrient('(N)', 25),
  SoilNutrient('(P)', 18),
  SoilNutrient('(K)', 32),
  SoilNutrient('(Ca)', 40),
];
