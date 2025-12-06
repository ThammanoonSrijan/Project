import 'package:flutter/material.dart';
import 'screens/build_simulator_screen.dart';

void main() {
  runApp(const ToramBuildApp());
}

class ToramBuildApp extends StatelessWidget {
  const ToramBuildApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toram Build Simulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF119D7C),
          secondary: Colors.cyanAccent,
        ),
        scaffoldBackgroundColor: const Color(0xFF16182A),
        useMaterial3: true,
      ),
      home: const BuildSimulatorScreen(),
    );
  }
}
