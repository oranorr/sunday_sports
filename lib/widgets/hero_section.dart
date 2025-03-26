import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Самый эффективный тренажер социальных навыков для вашей команды:',
                    style: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
                  const SizedBox(height: 30),
                  Text(
                    'Спортивная мафия.',
                    style: GoogleFonts.raleway(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[300],
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 300.ms)
                      .slideY(begin: 0.3),
                  const SizedBox(height: 60),
                  Text(
                    'Игра, которая учит:',
                    style: GoogleFonts.raleway(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 600.ms)
                      .slideY(begin: 0.3),
                  const SizedBox(height: 30),
                  _buildSkillsList(context),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Добавить прокрутку к форме контактов
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      textStyle: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      elevation: 10,
                      shadowColor: Colors.red.withOpacity(0.5),
                    ),
                    child: const Text('Записаться'),
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
    );
  }

  Widget _buildSkillsList(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 800;
          final isExtraWideScreen = constraints.maxWidth > 1200;

          final skillsItems = [
            _buildExpandableSkill(
              context,
              'Эмпатии',
              'Способность чувствовать и понимать эмоции других людей, учитывая их мнение и чувства при принятии решений.',
            ),
            _buildExpandableSkill(
              context,
              'Решительности',
              'Способность быстро и уверенно принимать решения в условиях неопределённости или стресса.',
            ),
            _buildExpandableSkill(
              context,
              'Лидерским качествам',
              'Способность вести за собой команду, мотивировать, делегировать задачи, принимать ответственность за командные действия.',
            ),
            _buildExpandableSkill(
              context,
              'Креативности',
              'Умение находить нестандартные решения для возникающих проблем, разрабатывать новые подходы и стратегии.',
            ),
            _buildExpandableSkill(
              context,
              'Гибкости мышления',
              'Способность адаптироваться к новым условиям, менять мнение или подход при появлении новых фактов.',
            ),
            _buildExpandableSkill(
              context,
              'Управлению конфликтами',
              'Способность мирно разрешать конфликты, находить компромиссы и поддерживать гармонию в группе.',
            ),
            _buildExpandableSkill(
              context,
              'Самообладанию',
              'Способность сохранять спокойствие и контролировать свои эмоции в напряжённой или стрессовой ситуации.',
            ),
            _buildExpandableSkill(
              context,
              'Навыкам переговоров',
              'Умение договариваться, достигать согласия, уверенно представлять свою точку зрения и учитывать интересы другой стороны.',
            ),
            _buildExpandableSkill(
              context,
              'Слушанию',
              'Способность внимательно слушать собеседника, понимать его позицию и строить диалог, основываясь на полученной информации.',
            ),
            _buildExpandableSkill(
              context,
              'Уверенности в себе',
              'Умение верить в свои силы, принимать вызовы и действовать даже в сложных ситуациях.',
            ),
          ];

          if (isExtraWideScreen) {
            // 3 колонки для очень широких экранов
            final itemsPerColumn = (skillsItems.length / 3).ceil();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(0, itemsPerColumn),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(
                        itemsPerColumn,
                        itemsPerColumn * 2 > skillsItems.length
                            ? skillsItems.length
                            : itemsPerColumn * 2),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(
                        itemsPerColumn * 2 > skillsItems.length
                            ? skillsItems.length
                            : itemsPerColumn * 2),
                  ),
                ),
              ],
            );
          } else if (isWideScreen) {
            // 2 колонки для широких экранов
            final itemsPerColumn = (skillsItems.length / 2).ceil();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(0, itemsPerColumn),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(itemsPerColumn),
                  ),
                ),
              ],
            );
          } else {
            // 1 колонка для мобильных устройств
            return Column(
              children: skillsItems,
            );
          }
        },
      ),
    ).animate().fadeIn(duration: 800.ms, delay: 800.ms).slideY(begin: 0.3);
  }

  Widget _buildExpandableSkill(
      BuildContext context, String title, String description) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isExpanded = false;

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red.withOpacity(0.7), width: 1),
          ),
          child: InkWell(
            onTap: () {
              setState(() => isExpanded = !isExpanded);
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 12,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  if (isExpanded) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        description,
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
