// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// class PerformanceDashboard extends StatelessWidget {
//   const PerformanceDashboard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 40),
//           // Title Section
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Value - Performance",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               Icon(Icons.info_outline, color: Colors.white),
//             ],
//           ),
//           const SizedBox(height: 10),
//           // Performance Text
//           const Text(
//             "+6056.20%",
//             style: TextStyle(
//               color: Colors.green,
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Chart Section
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: SfCartesianChart(
//                 backgroundColor: Colors.black,
//                 tooltipBehavior: TooltipBehavior(enable: true),
//                 primaryXAxis: CategoryAxis(
//                   axisLine: const AxisLine(color: Colors.white),
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//                 primaryYAxis: NumericAxis(
//                   minimum: 0,
//                   maximum: 7000,
//                   interval: 2000,
//                   axisLine: const AxisLine(color: Colors.transparent),
//                   labelStyle: const TextStyle(color: Colors.white),
//                   majorGridLines: MajorGridLines(color: Colors.grey.shade800),
//                 ),
//                 series: <SplineSeries<_ChartData, String>>[
//                   SplineSeries<_ChartData, String>(
//                     dataSource: getChartData(),
//                     xValueMapper: (_ChartData data, _) => data.x,
//                     yValueMapper: (_ChartData data, _) => data.y,
//                     markerSettings: const MarkerSettings(
//                       isVisible: true,
//                       color: Colors.green,
//                       borderColor: Colors.green,
//                     ),
//                     color: Colors.green,
//                     width: 3,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Timeframe Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: ["1W", "YTD", "1M", "3M", "1Y", "ALL"]
//                 .map((timeframe) => GestureDetector(
//                 onTap: () {
//                   print("$timeframe selected");
//                 },
//                 child: Text(
//                   timeframe,
//                   style: TextStyle(
//                     color: timeframe == "YTD" ? Colors.green : Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ).toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Chart Data
//   List<_ChartData> getChartData() {
//     return [
//       _ChartData('1W', 3000),
//       _ChartData('1M', 4000),
//       _ChartData('3M', 5500),
//       _ChartData('6M', 5840),
//       _ChartData('YTD', 6056),
//     ];
//   }
//
// }
// class _ChartData {
//   final String x;
//   final double y;
//
//   _ChartData(this.x, this.y);
// }
//
