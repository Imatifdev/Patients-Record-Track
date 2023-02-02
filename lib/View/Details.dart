// ignore_for_file: prefer_const_constructors

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:patientstrack/Widgets/datarow.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        MyDataRow(
                          title: 'Cases',
                          value: widget.totalCases.toString(),
                        ),
                        MyDataRow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                        MyDataRow(
                          title: 'Death',
                          value: widget.totalDeaths.toString(),
                        ),
                        MyDataRow(
                          title: 'Critical',
                          value: widget.critical.toString(),
                        ),
                        MyDataRow(
                          title: 'Today Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
