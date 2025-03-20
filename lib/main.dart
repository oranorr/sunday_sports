import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Спортивная Мафия',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF1A237E), // Тёмно-синий
          secondary: const Color(0xFFFFD700),
          surface: const Color(0xFF1E1E1E),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
