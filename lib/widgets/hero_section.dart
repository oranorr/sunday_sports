import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.primary.withOpacity(isDark ? 0.3 : 0.1),
            colorScheme.surface,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Фоновый паттерн
          Positioned.fill(
            child: CustomPaint(
              painter: GridPainter(
                color: colorScheme.onSurface.withOpacity(0.05),
                lineWidth: 0.5,
                spacing: 30,
              ),
            ),
          ),
          // Основной контент
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Самый эффективный тренажер социальных навыков для вашей команды:',
                        style: GoogleFonts.raleway(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
                      const SizedBox(height: 20),
                      Text(
                        'Спортивная мафия.',
                        style: GoogleFonts.raleway(
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                          color: colorScheme.onSurface,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 300.ms)
                          .slideY(begin: 0.3),
                      const SizedBox(height: 30),
                      Text(
                        'Игра, которая учит:',
                        style: GoogleFonts.raleway(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 600.ms)
                          .slideY(begin: 0.3),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final isWideScreen = constraints.maxWidth > 800;

                            if (isWideScreen) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildSkillCard(
                                          context,
                                          'Эмпатии',
                                          'Способность чувствовать и понимать эмоции других людей, учитывая их мнение и чувства при принятии решений.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Решительности',
                                          'Способность быстро и уверенно принимать решения в условиях неопределённости или стресса.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Лидерским качествам',
                                          'Способность вести за собой команду, мотивировать, делегировать задачи, принимать ответственность за командные действия.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Креативности',
                                          'Умение находить нестандартные решения для возникающих проблем, разрабатывать новые подходы и стратегии.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Гибкости мышления',
                                          'Способность адаптироваться к новым условиям, менять мнение или подход при появлении новых фактов.',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildSkillCard(
                                          context,
                                          'Управлению конфликтами',
                                          'Способность мирно разрешать конфликты, находить компромиссы и поддерживать гармонию в группе.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Самообладанию',
                                          'Способность сохранять спокойствие и контролировать свои эмоции в напряжённой или стрессовой ситуации.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Навыкам переговоров',
                                          'Умение договариваться, достигать согласия, уверенно представлять свою точку зрения и учитывать интересы другой стороны.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Слушанию',
                                          'Способность внимательно слушать собеседника, понимать его позицию и строить диалог, основываясь на полученной информации.',
                                        ),
                                        _buildSkillCard(
                                          context,
                                          'Уверенности в себе',
                                          'Умение верить в свои силы, принимать вызовы и действовать даже в сложных ситуациях.',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSkillCard(
                                    context,
                                    'Эмпатии',
                                    'Способность чувствовать и понимать эмоции других людей, учитывая их мнение и чувства при принятии решений.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Решительности',
                                    'Способность быстро и уверенно принимать решения в условиях неопределённости или стресса.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Лидерским качествам',
                                    'Способность вести за собой команду, мотивировать, делегировать задачи, принимать ответственность за командные действия.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Креативности',
                                    'Умение находить нестандартные решения для возникающих проблем, разрабатывать новые подходы и стратегии.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Гибкости мышления',
                                    'Способность адаптироваться к новым условиям, менять мнение или подход при появлении новых фактов.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Управлению конфликтами',
                                    'Способность мирно разрешать конфликты, находить компромиссы и поддерживать гармонию в группе.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Самообладанию',
                                    'Способность сохранять спокойствие и контролировать свои эмоции в напряжённой или стрессовой ситуации.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Навыкам переговоров',
                                    'Умение договариваться, достигать согласия, уверенно представлять свою точку зрения и учитывать интересы другой стороны.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Слушанию',
                                    'Способность внимательно слушать собеседника, понимать его позицию и строить диалог, основываясь на полученной информации.',
                                  ),
                                  _buildSkillCard(
                                    context,
                                    'Уверенности в себе',
                                    'Умение верить в свои силы, принимать вызовы и действовать даже в сложных ситуациях.',
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 800.ms)
                          .slideY(begin: 0.3),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Добавить прокрутку к форме контактов
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.secondary,
                          foregroundColor: colorScheme.onSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          textStyle: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: Text('Хорошо провести время'),
                      )
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 900.ms)
                          .slideY(begin: 0.3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
      BuildContext context, String title, String description) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              description,
              style: GoogleFonts.raleway(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;
  final double lineWidth;
  final double spacing;

  GridPainter({
    required this.color,
    required this.lineWidth,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
