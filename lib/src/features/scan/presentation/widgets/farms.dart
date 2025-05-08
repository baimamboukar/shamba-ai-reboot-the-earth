import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/extensions/widgetx.dart';

import 'package:shamba/src/router/intellibra_router.gr.dart' as routes;

class Farms extends StatefulWidget {
  const Farms({super.key});

  @override
  State<Farms> createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        14.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Farms',
              style: context.theme.textTheme.displaySmall!.copyWith(
                color: context.scheme.onSurface,
              ),
            ).floatL,
            Container(
              height: 32,
              width: 100,
              decoration: BoxDecoration(
                color: context.scheme.secondary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  HeroIcon(
                    HeroIcons.plusCircle,
                    size: 18,
                    color: context.scheme.primary,
                  ),
                  4.hGap,
                  Text(
                    'Add farm',
                    style: context.typography.bodyMedium!.copyWith(
                      color: context.scheme.onPrimary,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).hPaddingx(6),
            ).floatR.hPadding,
          ],
        ),
        14.vGap,
        SizedBox(
          height: 200,
          width: context.width,
          child: ListView.builder(
            itemCount: farms.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FarmBox(
                farm: farms[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class FarmBox extends StatelessWidget {
  const FarmBox({
    required this.farm,
    super.key,
  });
  final FarmData farm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(routes.RouteingRoute(farm: farm)),
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: context.scheme.primary.withOpacity(.825),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Text(
              farm.name,
              style: context.typography.bodyMedium!.copyWith(
                color: context.scheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ).floatL,
            12.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBox(
                      icon: HeroIcons.cloud,
                      data: farm.humidity,
                      label: 'Humidity',
                    ),
                    8.vGap,
                    IconBox(
                      icon: HeroIcons.sun,
                      data: farm.sun.split(' ')[0],
                      label: 'Sun',
                    ),
                  ],
                ),
                Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    color: context.scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      farm.temperature,
                      style: context.typography.bodyMedium!.copyWith(
                        color: context.scheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 44,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  const IconBox({
    required this.icon,
    required this.data,
    required this.label,
    super.key,
  });
  final HeroIcons icon;
  final String data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            color: context.scheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: HeroIcon(
            icon,
            size: 32,
            color: context.scheme.primary,
          ),
        ),
        8.hGap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: context.typography.bodyMedium!.copyWith(
                color: context.scheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              label,
              style: context.typography.bodyMedium!.copyWith(
                color: context.scheme.onSurface.withOpacity(.35),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FarmData {
  const FarmData({
    required this.forecast,
    required this.name,
    required this.humidity,
    required this.sun,
    required this.temperature,
    required this.soil,
    required this.ph,
    required this.nutrients,
    required this.cec,
    required this.location,
    required this.area,
    required this.crop,
    required this.texture,
  });
  final String name;
  final String location;
  final String area;
  final String crop;
  final String humidity;
  final String sun;
  final String temperature;
  final String soil;
  final String ph;
  final String nutrients;
  final String cec;
  final String texture;
  final List<Forecast> forecast;
}

class Forecast {
  const Forecast({
    required this.day,
    required this.temperature,
  });
  final String day;
  final String temperature;
}

const farms = [
  // Farm 1
  FarmData(
    name: 'Sunnyside Farm',
    location: 'California, USA',
    area: '10 acres',
    crop: 'Tomatoes',
    humidity: '60%',
    sun: '8 hours',
    temperature: '25°C',
    soil: 'Loam',
    ph: '6.5',
    nutrients: 'N: 150 ppm, P: 50 ppm, K: 200 ppm',
    cec: '15 cmol/kg',
    texture: 'Sandy loam',
    forecast: [
      Forecast(day: 'Monday', temperature: '24°C'),
      Forecast(day: 'Tuesday', temperature: '26°C'),
      Forecast(day: 'Wednesday', temperature: '28°C'),
      Forecast(day: 'Thursday', temperature: '27°C'),
      Forecast(day: 'Friday', temperature: '25°C'),
    ],
  ),
  // Farm 2
  FarmData(
    name: 'Green Valley Farm',
    location: 'Dschang, Cameroon',
    area: '20 hectares',
    crop: 'Grapes',
    humidity: '70%',
    sun: '7 hours',
    temperature: '20°C',
    soil: 'Clay',
    ph: '7.0',
    nutrients: 'N: 200 ppm, P: 60 ppm, K: 180 ppm',
    cec: '20 cmol/kg',
    texture: 'Clay ',
    forecast: [
      Forecast(day: 'Today', temperature: '21°C'),
      Forecast(day: 'Wednesday', temperature: '23°C'),
      Forecast(day: 'Thursday', temperature: '22°C'),
      Forecast(day: 'Friday', temperature: '20°C'),
    ],
  ),
  // Farm 3
  FarmData(
    name: 'IRAD road Farm',
    location: 'IRAD road, Dchang',
    area: '50 acres',
    crop: 'Wheat',
    humidity: '50%',
    sun: '10 hours',
    temperature: '30°C',
    soil: 'Sandy',
    ph: '6.0',
    nutrients: 'N: 120 ppm, P: 40 ppm, K: 150 ppm',
    cec: '10 cmol/kg',
    texture: 'Sandy',
    forecast: [
      Forecast(day: 'Monday', temperature: '29°C'),
      Forecast(day: 'Tuesday', temperature: '31°C'),
      Forecast(day: 'Wednesday', temperature: '33°C'),
      Forecast(day: 'Thursday', temperature: '32°C'),
      Forecast(day: 'Friday', temperature: '30°C'),
    ],
  ),
];
