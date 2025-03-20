import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onThemeToggle,
        child: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const AboutSection(),
            const TestimonialsSection(),
            const PricingSection(),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}
