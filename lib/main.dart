import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/screens/LandingScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const SmartTravelApp());
}

class SmartTravelApp extends StatelessWidget {
  const SmartTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3DBE7A)),
        useMaterial3: true,
      ),
      home: LandingScreen(), 
    );
  }
}