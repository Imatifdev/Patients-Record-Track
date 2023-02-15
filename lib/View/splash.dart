// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:patientstrack/View/Home.dart';
import 'package:patientstrack/View/world.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //animationcontroller is used to repeat the picture what we have applied on main screen
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorldRecords())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.jpg"))),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              }),
          Text(
            "Patients Tracking System",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
