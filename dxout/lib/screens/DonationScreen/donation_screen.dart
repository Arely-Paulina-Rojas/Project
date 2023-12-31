import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/DonationScreen/components/donation_body_screen.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: menuColor,
        title: const Text("Donaciones"),
      ),
      drawer: const CustomNavigationDrawer(),
      body: const DonationBodyScreen(),
    );
  }
}
