import 'package:dxout/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(color: menuColor),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage("assets/images/app_logo.png"),
                        width: 150),
                    SizedBox(
                      height: 70,
                    ),
                    SpinKitDoubleBounce(color: Colors.white, size: 70.0),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
