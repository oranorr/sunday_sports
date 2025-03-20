import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'О формате',
            style: GoogleFonts.roboto(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 40),
          Text(
            'Спортивная мафия - это не просто игра, а мощный инструмент для развития soft skills вашей команды. В процессе игры участники учатся эффективно коммуницировать, аргументировать свою позицию и работать в команде.',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 60),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard(
                context,
                'Коммуникация',
                'Учитесь эффективно доносить свои мысли и слушать других',
                Icons.chat_bubble_outline,
              ),
              _buildSkillCard(
                context,
                'Аргументация',
                'Развивайте навыки убеждения и отстаивания своей позиции',
                Icons.psychology_outlined,
              ),
              _buildSkillCard(
                context,
                'Командная работа',
                'Учитесь работать в команде и достигать общих целей',
                Icons.group,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2);
  }
}
