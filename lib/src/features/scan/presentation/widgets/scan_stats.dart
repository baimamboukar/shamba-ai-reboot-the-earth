import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/extensions/widgetx.dart';
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScanStats extends StatelessWidget {
  const ScanStats({
    required this.farmData,
    super.key,
  });
  final FarmData farmData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            4.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soil Health',
                  style: context.typography.bodyLarge!.copyWith(
                    color: context.scheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ).floatL,
                Text(
                  'Recently Collected Data',
                  style: context.typography.bodySmall!.copyWith(
                    color: context.scheme.secondary,
                    fontSize: 10,
                    //fontWeight: FontWeight.bold,
                  ),
                ).floatL,
              ],
            ),
          ],
        ),
        // const ScanHistory(),
        24.vGap,
        Row(
          children: [
            DataRow(data: farmData.cec.split(' ').first, label: 'CEC'),
            14.hGap,
            DataRow(data: farmData.texture.split(' ').first, label: 'Texture'),
          ],
        ),
        8.vGap,
        Row(
          children: [
            DataRow(data: farmData.ph, label: ' pH'),
            14.hGap,
            DataRow(
              data: farmData.nutrients.split(',').length.toString(),
              label: 'Nutrients',
            ),
          ],
        ),
      ],
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    required this.data,
    required this.label,
    super.key,
  });
  final String data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.typography.bodySmall!.copyWith(
            color: context.scheme.secondary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        8.hGap,
        Text(
          data,
          style: context.typography.bodySmall!.copyWith(
            color: context.scheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SoilNutrient {
  SoilNutrient(this.name, this.value);
  final String name;
  final int value;
}

final List<SoilNutrient> _nutrients = [
  SoilNutrient('Nitrogen (N)', 25),
  SoilNutrient('Phosphorus (P)', 18),
  SoilNutrient('Potassium (K)', 32),
  SoilNutrient('Calcium (Ca)', 40),
];
