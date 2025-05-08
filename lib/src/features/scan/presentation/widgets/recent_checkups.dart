import 'package:flutter/material.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/extensions/widgetx.dart';
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart';
import 'package:shamba/src/features/scan/presentation/widgets/scan_gauge.dart';
import 'package:shamba/src/features/scan/presentation/widgets/scan_stats.dart';

class RecentChekups extends StatelessWidget {
  const RecentChekups({
    required this.farmData,
    super.key,
  });
  final FarmData farmData;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // height: 200,
      decoration: BoxDecoration(
        color: context.scheme.onPrimary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ScanStats(farmData: farmData),
              const Spacer(),
              ScanGauge(farmData: farmData),
            ],
          ).hPaddingx(8),
          14.vGap,
        ],
      ),
    );
  }
}
