// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:patientstrack/Models/DataModel.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    StatsDataServices PatientStats = StatsDataServices();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FutureBuilder(
                future: PatientStats.getpatientsdata(),
                builder: ((context, AsyncSnapshot<PatientsData> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                      duration: Duration(),
                      controller: _controller,
                      color: Colors.blue,
                    ));
                  } else {
                    return Expanded(
                      child: Column(
                        children: [
                          PieChart(
                              chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              animationDuration: _controller.duration,
                              chartRadius: 100,
                              chartType: ChartType.ring,
                              dataMap: {
                                "Total": double.parse(
                                    snapshot.data!.tests.toString()),
                                "Died": double.parse(
                                    snapshot.data!.deaths.toString()),
                                "Rehabilitate": double.parse(
                                    snapshot.data!.recovered.toString())
                              }),
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
                          InkWell(
                            highlightColor: Colors.black,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              width: MediaQuery.of(context).size.width - 20,
                              child: Center(
                                  child: Text(
                                "Check Stats by Country",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                })),
          ],
        ),
      ),
    );
  }
}
