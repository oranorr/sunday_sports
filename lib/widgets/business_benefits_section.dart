import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BusinessBenefitsSection extends StatelessWidget {
  const BusinessBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withOpacity(0.8),
            colorScheme.primary.withOpacity(0.6),
          ],
        ),
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          children: [
            // Заголовок и верхняя часть с градиентным фоном
            Column(
              children: [
                // Заголовок раздела с анимацией
                Text(
                  'Типичный корпоративный тимбилдинг — деньги на ветер',
                  style: GoogleFonts.montserrat(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: Duration(milliseconds: 600))
                    .slideY(
                        begin: 0.2,
                        end: 0,
                        duration: Duration(milliseconds: 800)),

                const SizedBox(height: 40),

                // Три блока "боли"
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmallScreen = constraints.maxWidth < 800;

                    return isSmallScreen
                        ? Column(
                            children: [
                              _buildPainCard(
                                context,
                                description:
                                    'Верёвочные курсы? Заводят пару фоток в Инстаграм и забывают.',
                                delay: 0,
                              ),
                              _buildPainCard(
                                context,
                                description:
                                    'Совместные посиделки? Сплачивают максимум двух коллег за столом.',
                                delay: 100,
                              ),
                              _buildPainCard(
                                context,
                                description:
                                    'Бизнес-тренинги? Скучно, теория без практики.',
                                delay: 200,
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildPainCard(
                                  context,
                                  description:
                                      'Верёвочные курсы? Заводят пару фоток в Инстаграм и забывают.',
                                  delay: 0,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _buildPainCard(
                                  context,
                                  description:
                                      'Совместные посиделки? Сплачивают максимум двух коллег за столом.',
                                  delay: 100,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _buildPainCard(
                                  context,
                                  description:
                                      'Бизнес-тренинги? Скучно, теория без практики.',
                                  delay: 200,
                                ),
                              ),
                            ],
                          );
                  },
                ),

                const SizedBox(height: 60),

                // Альтернативное решение
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.amber,
                        size: 40,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Мафия — это реальный навык, а не просто веселье. Люди на практике учатся убеждать, видеть манипуляции и строить доверие в условиях неопределённости.',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(
                        delay: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 600))
                    .scale(
                        begin: Offset(0.95, 0.95),
                        duration: Duration(milliseconds: 500)),
              ],
            ),

            // Основная секция с преимуществами
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              // color: Colors.grey[900],
              child: Column(
                children: [
                  // Первый ряд из двух карточек
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 800;
                      return isSmallScreen
                          ? Column(
                              children: [
                                _buildFeatureCard(
                                  context,
                                  title: 'Сплочение команды',
                                  description:
                                      'Игра разрушает барьеры между коллегами, улучшает взаимодействие между отделами. Улучшает доверие и способность работать в команде в стрессовых ситуациях.',
                                  icon: Icons.people,
                                  delay: 0,
                                ),
                                _buildFeatureCard(
                                  context,
                                  title: 'Выявление неформальных лидеров',
                                  description:
                                      'В неформальной среде раскрываются сотрудники с сильными лидерскими качествами. Видно, кто умеет убеждать, анализировать и вести за собой.',
                                  icon: Icons.star,
                                  delay: 100,
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildFeatureCard(
                                    context,
                                    title: 'Сплочение команды',
                                    description:
                                        'Игра разрушает барьеры между коллегами, улучшает взаимодействие между отделами. Улучшает доверие и способность работать в команде в стрессовых ситуациях.',
                                    icon: Icons.people,
                                    delay: 0,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _buildFeatureCard(
                                    context,
                                    title: 'Выявление неформальных лидеров',
                                    description:
                                        'В неформальной среде раскрываются сотрудники с сильными лидерскими качествами. Видно, кто умеет убеждать, анализировать и вести за собой.',
                                    icon: Icons.star,
                                    delay: 100,
                                  ),
                                ),
                              ],
                            );
                    },
                  ),

                  const SizedBox(height: 30),

                  // Расширенный блок - выявление потенциала
                  _buildExpandableCard(
                    context,
                    title: 'Выявление потенциала сотрудников',
                    mainDescription:
                        'Игровая оценка ключевых софт-скиллов сотрудников в непринужденной обстановке.',
                    details: [
                      'Кто хорошо анализирует? Кто быстро принимает решения?',
                      'Кто умеет аргументировать и вести диалог?',
                      'Кто проявляет нестандартное мышление и креативность?',
                      'Кто может управлять эмоциями под давлением?',
                    ],
                    icon: Icons.psychology,
                    delay: 200,
                  ),

                  const SizedBox(height: 30),

                  // Второй ряд из двух карточек
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 800;
                      return isSmallScreen
                          ? Column(
                              children: [
                                _buildFeatureCard(
                                  context,
                                  title: 'Прокачка коммуникативных навыков',
                                  description:
                                      'Улучшает умение убеждать и аргументировать свою точку зрения. Развивает навыки активного слушания и чтения невербальных сигналов.',
                                  icon: Icons.question_answer,
                                  delay: 300,
                                ),
                                _buildFeatureCard(
                                  context,
                                  title: 'Управление стрессом и давлением',
                                  description:
                                      'Игра моделирует ситуации высокой неопределённости, помогая сотрудникам сохранять хладнокровие. Тренирует эмоциональный интеллект и навык принятия решений под давлением.',
                                  icon: Icons.bolt,
                                  delay: 400,
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildFeatureCard(
                                    context,
                                    title: 'Прокачка коммуникативных навыков',
                                    description:
                                        'Улучшает умение убеждать и аргументировать свою точку зрения. Развивает навыки активного слушания и чтения невербальных сигналов.',
                                    icon: Icons.question_answer,
                                    delay: 300,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _buildFeatureCard(
                                    context,
                                    title: 'Управление стрессом и давлением',
                                    description:
                                        'Игра моделирует ситуации высокой неопределённости, помогая сотрудникам сохранять хладнокровие. Тренирует эмоциональный интеллект и навык принятия решений под давлением.',
                                    icon: Icons.bolt,
                                    delay: 400,
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultPoint(String text, IconData icon, {required int delay}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: delay))
        .slideX(begin: -0.1, end: 0, duration: Duration(milliseconds: 500));
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
            delay: Duration(milliseconds: delay),
            duration: Duration(milliseconds: 600))
        .slideY(begin: 0.1, end: 0, duration: Duration(milliseconds: 500));
  }

  Widget _buildExpandableCard(
    BuildContext context, {
    required String title,
    required String mainDescription,
    required List<String> details,
    required IconData icon,
    required int delay,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            mainDescription,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 20),
                  Container(
                    height: 1,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 20),
                  ...details.map((detail) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_right,
                                color: Colors.white, size: 24),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                detail,
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        );
      },
    )
        .animate()
        .fadeIn(
            delay: Duration(milliseconds: delay),
            duration: Duration(milliseconds: 600))
        .slideY(begin: 0.1, end: 0, duration: Duration(milliseconds: 500));
  }

  Widget _buildPainCard(
    BuildContext context, {
    required String description,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(24),
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
          Icon(
            Icons.cancel_outlined,
            color: Colors.redAccent,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delay),
          duration: Duration(milliseconds: 600),
        )
        .slideY(
          begin: 0.2,
          end: 0,
          delay: Duration(milliseconds: delay),
          duration: Duration(milliseconds: 800),
        );
  }
}
