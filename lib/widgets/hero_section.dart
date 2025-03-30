import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sunday_sports/shared/cta_button.dart';
import 'package:sunday_sports/shared/extensions.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.isSmallScreen ? 16.0 : 20.0,
                  vertical: context.isSmallScreen ? 30.0 : 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Спортивная Мафия как тренажер социальных навыков для бизнеса.',
                    style: GoogleFonts.raleway(
                      fontSize: context.isSmallScreen
                          ? 32
                          : context.isMediumScreen
                              ? 48
                              : 75,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 5.0),
                          blurRadius: 20.0,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
                  SizedBox(height: context.isSmallScreen ? 30 : 55),
                  Text(
                    'Развиваем критическое мышление, уверенность в переговорах и командное взаимодействие через игровую механику спортивной мафии.',
                    style: GoogleFonts.raleway(
                      fontSize: context.isSmallScreen
                          ? 24
                          : context.isMediumScreen
                              ? 36
                              : 55,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[300],
                      // shadows: [
                      //   Shadow(
                      //     offset: const Offset(2.0, 2.0),
                      //     blurRadius: 3.0,
                      //     color: Colors.black.withOpacity(0.7),
                      //   ),
                      // ],
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 300.ms)
                      .slideY(begin: 0.3),
                  SizedBox(height: context.isSmallScreen ? 20 : 30),
                  CTAButton(text: 'Записаться'),
                  SizedBox(height: context.isSmallScreen ? 20 : 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
