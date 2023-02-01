// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Widgets/datarow.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            PieChart(
                animationDuration: _controller.duration,
                chartRadius: 100,
                chartType: ChartType.ring,
                dataMap: {"Total": 3000, "Died": 1000, "Rehabilitate": 1800}),
            SizedBox(
              height: 30,
            ),
            MyDataRow(
              title: 'Total',
              value: 3000,
            ),
            MyDataRow(
              title: 'Died',
              value: 1200,
            ),
            MyDataRow(
              title: 'Recovered',
              value: 1700,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width - 20,
              child: Center(
                  child: Text(
                "Check Stats by Coutry",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
