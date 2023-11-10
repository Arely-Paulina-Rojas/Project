import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/AboutScreen/components/about_body_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: menuColor,
        title: const Text("Acerca de la app"),
      ),
      drawer: const CustomNavigationDrawer(),
      body: const AboutBodyScreen(),
    );
  }
}
