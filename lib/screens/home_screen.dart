import 'package:flutter/material.dart';
import '../widgets/business_benefits_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/reviews_section.dart';
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
            const BusinessBenefitsSection(),
            const AboutSection(),
            const ReviewsSection(),
            const PricingSection(),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}
