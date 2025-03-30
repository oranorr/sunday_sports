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
                  'Польза для бизнеса',
                  style: GoogleFonts.montserrat(
                    fontSize: 48,
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

                const SizedBox(height: 20),

                // Подзаголовок
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Почему это полезно для вашей компании?',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 600))
                      .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: Duration(milliseconds: 800)),
                ),

                const SizedBox(height: 40),

                // Общее описание в карточке
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
                  child: Text(
                    'Спортивная мафия — это не просто развлечение, а мощный инструмент для развития команды и сотрудников.',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    .animate()
                    .fadeIn(
                        delay: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 600))
                    .scale(
                        begin: Offset(0.95, 0.95),
                        duration: Duration(milliseconds: 500)),
                // Основная секция с преимуществами
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
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
                                        title:
                                            'Прокачка коммуникативных навыков',
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
                                        title:
                                            'Управление стрессом и давлением',
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

            // Разделитель с иконкой
            // Container(
            //   height: 80,
            //   width: double.infinity,
            //   color: Colors.grey[900],
            //   child: Center(
            //     child: Container(
            //       padding: const EdgeInsets.all(16),
            //       decoration: BoxDecoration(
            //         color: colorScheme.primaryContainer,
            //         shape: BoxShape.circle,
            //         boxShadow: [
            //           BoxShadow(
            //             color: colorScheme.primary.withOpacity(0.3),
            //             blurRadius: 15,
            //             spreadRadius: 5,
            //           ),
            //         ],
            //       ),
            //       child: Icon(
            //         Icons.business_center,
            //         size: 28,
            //         color: colorScheme.onPrimaryContainer,
            //       ),
            //     ),
            //   ),
            // ),

            // Итоговая секция "Почему это работает" - закомментирована
            /*
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Почему это работает?',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: Duration(milliseconds: 600)),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primaryContainer,
                          colorScheme.primary.withOpacity(0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.local_fire_department,
                                  color: Colors.white, size: 36),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: Text(
                                'Спортивная Мафия — это HR-инструмент, который работает!',
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildResultPoint(
                          'HR-менеджеры получат полезную информацию о сотрудниках',
                          Icons.check_circle_outline,
                          delay: 200,
                        ),
                        const SizedBox(height: 16),
                        _buildResultPoint(
                          'Топ-менеджеры увидят скрытые таланты в команде',
                          Icons.check_circle_outline,
                          delay: 300,
                        ),
                        const SizedBox(height: 16),
                        _buildResultPoint(
                          'Коллектив станет более сплочённым, улучшится рабочая атмосфера',
                          Icons.check_circle_outline,
                          delay: 400,
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(
                          delay: Duration(milliseconds: 200),
                          duration: Duration(milliseconds: 800))
                      .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: Duration(milliseconds: 600)),
                ],
              ),
            ),
            */
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
}
