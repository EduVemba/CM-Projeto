import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/screens/addranking_screen.dart';
import 'package:projeto/screens/landing_screen.dart';
import 'package:projeto/screens/map_screen.dart';
import 'package:projeto/screens/mytravels_screen.dart';
import 'package:projeto/screens/preferences_screen.dart';
import 'package:projeto/screens/profile_screen.dart';
import 'package:projeto/screens/register_screen.dart';
import 'package:projeto/screens/traveldetails_screen.dart';

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
      home: AddRankingScreen(),
    );
  }
}