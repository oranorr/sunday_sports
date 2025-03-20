import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Спортивная Мафия как Тимбилдинг: Прокачай Soft Skills команды!',
                style: GoogleFonts.roboto(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2),
              const SizedBox(height: 20),
              Text(
                'Игры, которые учат общению, аргументации и командной работе.',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // TODO: Добавить прокрутку к форме контактов
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Заказать мероприятие',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
