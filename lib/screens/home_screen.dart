import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
