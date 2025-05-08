import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/extensions/widgetx.dart';
import 'package:shamba/src/features/scan/presentation/widgets/device_box.dart';
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart';
import 'package:shamba/src/features/scan/presentation/widgets/recent_checkups.dart';
import 'package:shamba/src/features/scan/presentation/widgets/welcome_tile.dart';
import 'package:shamba/src/features/scan/screening.dart';

//TODO: #35 redesign self check page to make it modern
@RoutePage()
class SelfCheck extends StatelessWidget {
  const SelfCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.vGap,
            const WelcomeTile(),
            //  8.vGap,
            //AnnouncementZone(),
            24.vGap,
            Container(
              height: 220,
              width: context.width,
              decoration: BoxDecoration(
                color: context.scheme.secondary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const SoilChemics(),
            ),
            34.vGap,
            // ActionsList(),
            // 14.vGap,
            const Farms(),
          ],
        ).hPadding,
      ),
    );
  }
}

class AnnouncementZone extends StatelessWidget {
  const AnnouncementZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 54,
      width: context.width,
      decoration: BoxDecoration(
        color: context.scheme.error,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          children: [
            HeroIcon(
              HeroIcons.exclamationTriangle,
              size: 34,
              color: context.scheme.onPrimary,
            ),
            8.hGap,
            Flexible(
              child: Text(
                'There is an incoming brutal wind in the next 48 hours',
                style: context.typography.bodyMedium!.copyWith(
                  color: context.scheme.onPrimary,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }
}

class ActionsList extends StatelessWidget {
  const ActionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CallAction(
          icon: HeroIcons.squares2x2,
          label: 'Dashboard',
        ),
        CallAction(
          icon: HeroIcons.cloud,
          label: 'Weather',
        ),
        CallAction(
          icon: HeroIcons.shieldExclamation,
          label: 'Alerts',
        ),
        CallAction(
          icon: HeroIcons.arrowPath,
          label: 'Connect',
        ),
      ],
    );
  }
}

class CallAction extends StatelessWidget {
  const CallAction({
    required this.icon,
    required this.label,
    super.key,
  });
  final HeroIcons icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: context.scheme.primaryContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: HeroIcon(
            icon,
            size: 34,
            color: context.scheme.primary,
          ),
        ),
        Text(
          label,
          style: context.typography.bodyMedium!.copyWith(
            color: context.scheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ).hPaddingx(8);
  }
}
