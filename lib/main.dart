import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Firebase Imports
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto/firebase_options.dart'; 
import 'package:projeto/screens/session/landing_screen.dart';

void main() async {
  // Garante que as comunicações nativas estão prontas
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase com as opções do SmartTravel
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const LandingScreen(),
    );
  }
}
