import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:flutter/material.dart';

class AboutBodyScreen extends StatelessWidget {
  const AboutBodyScreen({Key? key}) : super(key: key);

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
            "Acerca de la app",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet libero non tellus sollicitudin porta. Sed at lorem sit amet dui pellentesque luctus in eget urna. Cras ut velit gravida, aliquam lorem nec, maximus urna. Donec ut ultricies massa. Nullam vitae lorem tincidunt, fringilla risus vel, mollis massa. Duis ex massa, pulvinar scelerisque sollicitudin nec, rhoncus nec urna. Cras eget diam sit amet nisl ornare lobortis. Pellentesque finibus lacus neque, a elementum nibh ultricies non. Morbi hendrerit, turpis at elementum tincidunt, ante ipsum fringilla urna, sed euismod nisl ex quis odio. Duis pulvinar sollicitudin pulvinar. Morbi suscipit facilisis scelerisque. Nam eu mollis quam, sed placerat eros.",
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/app_logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet libero non tellus sollicitudin porta. Sed at lorem sit amet dui pellentesque luctus in eget urna. Cras ut velit gravida, aliquam lorem nec, maximus urna. Donec ut ultricies massa. Nullam vitae lorem tincidunt, fringilla risus vel, mollis massa. Duis ex massa, pulvinar scelerisque sollicitudin nec, rhoncus nec urna. Cras eget diam sit amet nisl ornare lobortis. Pellentesque finibus lacus neque, a elementum nibh ultricies non. Morbi hendrerit, turpis at elementum tincidunt, ante ipsum fringilla urna, sed euismod nisl ex quis odio. Duis pulvinar sollicitudin pulvinar. Morbi suscipit facilisis scelerisque. Nam eu mollis quam, sed placerat eros.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ));
  }
}
