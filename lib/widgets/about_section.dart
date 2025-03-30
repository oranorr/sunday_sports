import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Column(
        children: [
          Text(
            '3 часа — а эффект на годы',
            style: GoogleFonts.montserrat(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 800.ms),

          const SizedBox(height: 60),

          // Шаги тренинга
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: _buildTimelineSteps(context),
          ),

          const SizedBox(height: 60),

          // Форматы
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.rocket_launch,
                  color: Colors.orange,
                  size: 40,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Гибкие форматы: можем провести у вас в офисе, в коворкинге или онлайн.',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

          const SizedBox(height: 40),

          // Кому это подходит (из блока 4)
          Column(
            children: [
              Text(
                'Каждому, кто работает с людьми',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms, delay: 800.ms),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;

                  if (isWideScreen) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: _buildTargetCard(context, '💼 Менеджерам',
                                'учатся убеждать, вести переговоры, строить доверие.')),
                        const SizedBox(width: 20),
                        Expanded(
                            child: _buildTargetCard(context, '👨‍💻 Айтишникам',
                                'прокачивают краткость, чёткость формулировок.')),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildTargetCard(context, '💼 Менеджерам',
                            'учатся убеждать, вести переговоры, строить доверие.'),
                        const SizedBox(height: 20),
                        _buildTargetCard(context, '👨‍💻 Айтишникам',
                            'прокачивают краткость, чёткость формулировок.'),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;

                  if (isWideScreen) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: _buildTargetCard(context, '📊 Продажникам',
                                'учатся понимать клиентов, видеть скрытые сигналы.')),
                        const SizedBox(width: 20),
                        Expanded(
                            child: _buildTargetCard(
                                context,
                                '🎯 Топ-менеджерам',
                                'выявляют скрытых лидеров в команде.')),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildTargetCard(context, '📊 Продажникам',
                            'учатся понимать клиентов, видеть скрытые сигналы.'),
                        const SizedBox(height: 20),
                        _buildTargetCard(context, '🎯 Топ-менеджерам',
                            'выявляют скрытых лидеров в команде.'),
                      ],
                    );
                  }
                },
              ),
            ],
          ).animate().fadeIn(duration: 800.ms, delay: 1000.ms),
        ],
      ),
    );
  }

  Widget _buildTimelineSteps(BuildContext context) {
    final steps = [
      _TimelineStep(
        number: '1️⃣',
        title: 'Вводная часть',
        description: '20 минут, объясняем механику, включаем в процесс.',
      ),
      _TimelineStep(
        number: '2️⃣',
        title: 'Игры',
        description: '3-4 раунда, каждый сложнее, чем предыдущий.',
      ),
      _TimelineStep(
        number: '3️⃣',
        title: 'Разбор',
        description: 'анализируем ключевые моменты, обсуждаем стратегии.',
      ),
      _TimelineStep(
        number: '4️⃣',
        title: 'Выводы',
        description: 'что участники могут применять в реальной жизни.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 800;

        if (isWideScreen) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: steps.map((step) {
              final index = steps.indexOf(step);
              return Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildTimelineStepCard(context, step, index)),
                    if (index < steps.length - 1)
                      Container(
                        width: 20,
                        height: 2,
                        margin: EdgeInsets.only(top: 35),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                  ],
                ),
              );
            }).toList(),
          );
        } else {
          return Column(
            children: steps.map((step) {
              final index = steps.indexOf(step);
              return Column(
                children: [
                  _buildTimelineStepCard(context, step, index),
                  if (index < steps.length - 1)
                    Container(
                      width: 2,
                      height: 30,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                ],
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildTimelineStepCard(
      BuildContext context, _TimelineStep step, int index) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.number,
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            step.title,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            step.description,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: colorScheme.onSurface.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 200 * index),
          duration: Duration(milliseconds: 800),
        )
        .slideY(
          begin: 0.2,
          end: 0,
          delay: Duration(milliseconds: 200 * index),
          duration: Duration(milliseconds: 800),
        );
  }

  Widget _buildTargetCard(
      BuildContext context, String title, String description) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title — ',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineStep {
  final String number;
  final String title;
  final String description;

  _TimelineStep({
    required this.number,
    required this.title,
    required this.description,
  });
}
