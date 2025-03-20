import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Определяем основные цвета
    const silverColor = Color(0xFFC0C0C0);
    const midnightBlack = Color(0xFF000000);
    const accentBlue = Color(0xFF4A90E2);
    const accentOrange = Color(0xFFFF9966);

    // Темная тема
    final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: silverColor,
        secondary: accentOrange,
        surface: midnightBlack,
        error: const Color(0xFFCF6679),
        onPrimary: midnightBlack,
        onSecondary: Colors.white,
        onSurface: silverColor,
        onError: Colors.black,
      ),
      textTheme: GoogleFonts.ralewayTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: silverColor,
              displayColor: silverColor,
            ),
      ),
      cardTheme: CardTheme(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );

    // Светлая тема
    final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: accentBlue,
        secondary: accentOrange,
        surface: Colors.white,
        error: const Color(0xFFB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
        onError: Colors.white,
      ),
      textTheme: GoogleFonts.ralewayTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: Colors.black87,
              displayColor: Colors.black87,
            ),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );

    return MaterialApp(
      title: 'Спортивная Мафия',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(onThemeToggle: toggleTheme),
    );
  }
}
