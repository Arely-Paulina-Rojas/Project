import 'package:dxout/constants.dart';
import 'package:dxout/screens/OnboardingScreen/onboarding_screen.dart';
import 'package:dxout/services/notification_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DXOUT',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: menuColor,
      ),
      home: const OnboardingScreen(),
    );
  }
}
