import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DonationBodyScreen extends StatelessWidget {
  const DonationBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Donaciones",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet libero non tellus sollicitudin porta. Sed at lorem sit amet dui pellentesque luctus in eget urna. Cras ut velit gravida, aliquam lorem nec, maximus urna. Donec ut ultricies massa. Nullam vitae lorem tincidunt, fringilla risus vel, mollis massa. Duis ex massa, pulvinar scelerisque sollicitudin nec, rhoncus nec urna.",
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/qr_code.png',
            width: 500,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () =>
                launchUrlString('https://www.paypal.me/AngelAlvarezM71'),
            child: const Text(
              'Donar aquí c:',
              style: TextStyle(
                fontSize: 25,
                color: menuColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet libero non tellus sollicitudin porta. Sed at lorem sit amet dui pellentesque luctus in eget urna. Cras ut velit gravida, aliquam lorem nec, maximus urna. Donec ut ultricies massa. Nullam vitae lorem tincidunt, fringilla risus vel, mollis massa. Duis ex massa, pulvinar scelerisque sollicitudin nec, rhoncus nec urna. Cras eget diam sit amet nisl ornare lobortis. Pellentesque finibus lacus neque, a elementum nibh ultricies non.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ));
  }
}
