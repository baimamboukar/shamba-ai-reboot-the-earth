import 'package:flutter/material.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScanGauge extends StatelessWidget {
  const ScanGauge({
    required this.farmData,
    super.key,
  });
  final FarmData farmData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      width: 128,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            maximum: 14,
            interval: 1,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 6,
                color: Colors.red,
                startWidth: 10,
                endWidth: 4,
              ),
              GaugeRange(
                startValue: 8,
                endValue: 14,
                color: Colors.green,
                startWidth: 4,
                endWidth: 10,
              ),
            ],
            showLabels: false,
            // showTicks: false,
            pointers: <GaugePointer>[
              NeedlePointer(value: double.parse(farmData.ph)),
            ],

            // RangePointer(
            //   value: 72,
            //   width: 8,
            //   color: context.scheme.primary,
            //   enableAnimation: true,
            //   cornerStyle: CornerStyle.bothCurve,
            // ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      color: context.scheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            farmData.ph,
                            style: context.bodyLg.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'pH',
                            style: context.bodySm.copyWith(
                              //   fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
