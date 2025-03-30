import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sunday_sports/shared/extensions.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.symmetric(
          vertical: context.isSmallScreen ? 40 : 60,
          horizontal: context.isSmallScreen ? 15 : 20),
      child: Column(
        children: [
          Text(
            'Игровая механика → реальный рост',
            style: GoogleFonts.montserrat(
              fontSize: context.isSmallScreen
                  ? 28
                  : context.isMediumScreen
                      ? 36
                      : 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
          SizedBox(height: context.isSmallScreen ? 40 : 80),
          _buildSkillsGrid(context),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final skillsData = [
      {
        'title': 'Аргументация и уверенная речь',
        'description':
            'Чётко и быстро формулировать свою позицию, быть убедительным даже под давлением',
        'icon': Icons.record_voice_over,
        'delay': 0,
      },
      {
        'title': 'Выявление лидеров и работа в команде',
        'description':
            'Без доверия и сотрудничества победить невозможно. В игре проявляются сильные командные игроки и лидеры.',
        'icon': Icons.groups,
        'delay': 200,
      },
      {
        'title': 'Навык чтения людей',
        'description':
            'Ложь, неуверенность, манипуляции — всё это проявляется в речи и поведении. Игра тренирует навык видеть скрытые сигналы.',
        'icon': Icons.psychology,
        'delay': 400,
      },
      {
        'title': 'Критическое мышление и логика',
        'description':
            'Нужно анализировать факты, выявлять несостыковки, выстраивать логичные аргументы.',
        'icon': Icons.tips_and_updates,
        'delay': 600,
      },
      {
        'title': 'Стрессоустойчивость и адаптивность',
        'description':
            'Давление, тайминг, подозрения – нужно держать удар, адаптироваться и быстро принимать решения.',
        'icon': Icons.bolt,
        'delay': 800,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Определяем количество колонок в зависимости от ширины экрана
        final width = constraints.maxWidth;

        if (width > 1000) {
          // Три колонки для очень широких экранов
          return _buildGridLayout(context, skillsData, 3);
        } else if (width > 600) {
          // Две колонки для широких экранов
          return _buildGridLayout(context, skillsData, 2);
        } else {
          // Одна колонка для мобильных устройств
          return _buildGridLayout(context, skillsData, 1);
        }
      },
    );
  }

  Widget _buildGridLayout(BuildContext context,
      List<Map<String, dynamic>> skillsData, int columns) {
    // Делим навыки на ряды
    final rows = (skillsData.length / columns).ceil();

    return Column(
      children: List.generate(rows, (rowIndex) {
        final startIndex = rowIndex * columns;
        final endIndex = (startIndex + columns > skillsData.length)
            ? skillsData.length
            : startIndex + columns;

        return Padding(
          padding: EdgeInsets.only(bottom: context.isSmallScreen ? 15 : 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              endIndex - startIndex,
              (columnIndex) {
                final dataIndex = startIndex + columnIndex;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: columns > 1
                            ? (context.isSmallScreen ? 5.0 : 10.0)
                            : 0),
                    child: _buildSkillCard(
                      context: context,
                      title: skillsData[dataIndex]['title'] as String,
                      description:
                          skillsData[dataIndex]['description'] as String,
                      icon: skillsData[dataIndex]['icon'] as IconData,
                      delay: skillsData[dataIndex]['delay'] as int,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSkillCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required int delay,
  }) {
    // Адаптивная высота в зависимости от размера экрана
    final cardHeight = context.isSmallScreen ? 250.0 : 230.0;

    return Container(
      // Фиксированная высота для всех карточек
      height: cardHeight,
      padding: EdgeInsets.all(context.isSmallScreen ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Иконка с заголовком
          Container(
            margin: EdgeInsets.only(bottom: context.isSmallScreen ? 12 : 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(context.isSmallScreen ? 8 : 12),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.indigo.shade200,
                    size: context.isSmallScreen ? 22 : 28,
                  ),
                ),
                SizedBox(width: context.isSmallScreen ? 10 : 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: context.isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Описание
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: context.isSmallScreen ? 14 : 16,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(
          delay: Duration(milliseconds: delay),
          duration: Duration(milliseconds: 800),
        );
  }
}
