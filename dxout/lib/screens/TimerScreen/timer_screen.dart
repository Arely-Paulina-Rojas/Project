import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TimerScreen/components/timer_body_screen.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: menuColor,
        title: const Text("Temporizador"),
      ),
      drawer: const CustomNavigationDrawer(),
      body: TimerBodyScreen(),
    );
  }
}
