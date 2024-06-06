import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardScreen extends StatelessWidget {
  final List<HeartRateData> heartRateData = [
    HeartRateData(DateTime.now().subtract(Duration(minutes: 10)), 75),
    HeartRateData(DateTime.now().subtract(Duration(minutes: 5)), 80),
    HeartRateData(DateTime.now(), 78),
  ];

  final List<BloodPressureData> bloodPressureData = [
    BloodPressureData(DateTime.now().subtract(Duration(minutes: 10)), 120, 80),
    BloodPressureData(DateTime.now().subtract(Duration(minutes: 5)), 122, 82),
    BloodPressureData(DateTime.now(), 119, 78),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffd9d9d9),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: HeartRateChart(data: heartRateData),
            ),
            SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: BloodPressureChart(data: bloodPressureData),
            ),
            SizedBox(height: 16),
            // Additional content can be added here to occupy the remaining third
          ],
        ),
      ),
    );
  }
}

class HeartRateData {
  final DateTime time;
  final int heartRate;

  HeartRateData(this.time, this.heartRate);
}

class BloodPressureData {
  final DateTime time;
  final int systolic;
  final int diastolic;

  BloodPressureData(this.time, this.systolic, this.diastolic);
}

class HeartRateChart extends StatelessWidget {
  final List<HeartRateData> data;

  HeartRateChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<HeartRateData, DateTime>> series = [
      charts.Series(
        id: "Heart Rate",
        data: data,
        domainFn: (HeartRateData series, _) => series.time,
        measureFn: (HeartRateData series, _) => series.heartRate,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];

    return charts.TimeSeriesChart(
      series,
      animate: true,
      behaviors: [
        charts.SeriesLegend(
          position:
              charts.BehaviorPosition.bottom, // Position legend at the bottom
          horizontalFirst: false,
          desiredMaxColumns: 2,
        ),
      ],
    );
  }
}

class BloodPressureChart extends StatelessWidget {
  final List<BloodPressureData> data;

  BloodPressureChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BloodPressureData, DateTime>> series = [
      charts.Series(
        id: "Systolic",
        data: data,
        domainFn: (BloodPressureData series, _) => series.time,
        measureFn: (BloodPressureData series, _) => series.systolic,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series(
        id: "Diastolic",
        data: data,
        domainFn: (BloodPressureData series, _) => series.time,
        measureFn: (BloodPressureData series, _) => series.diastolic,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];

    return charts.TimeSeriesChart(
      series,
      animate: true,
      behaviors: [
        charts.SeriesLegend(
          position:
              charts.BehaviorPosition.bottom, // Position legend at the bottom
          horizontalFirst: false,
          desiredMaxColumns: 2,
        ),
      ],
    );
  }
}
