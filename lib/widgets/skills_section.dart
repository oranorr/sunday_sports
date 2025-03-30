import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Text(
              'Игра, которая учит:',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.3,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(duration: 800.ms, delay: 600.ms)
                .slideY(begin: 0.3),
            const SizedBox(height: 40),
            _buildSkillsList(context),
            const SizedBox(height: 60),
            _buildGradientButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFF3B30),
            const Color(0xFF1A1A1A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF3B30).withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: const Color(0xFFFF3B30).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Добавить прокрутку к форме контактов
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 24,
            ),
            child: Text(
              'Записаться',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 800.ms, delay: 900.ms).slideY(begin: 0.3);
  }

  Widget _buildSkillsList(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
            final itemsPerColumn = (skillsItems.length / 3).ceil();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(0, itemsPerColumn),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(
                        itemsPerColumn,
                        itemsPerColumn * 2 > skillsItems.length
                            ? skillsItems.length
                            : itemsPerColumn * 2),
                  ),
                ),
                const SizedBox(width: 24),
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
            final itemsPerColumn = (skillsItems.length / 2).ceil();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(0, itemsPerColumn),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: skillsItems.sublist(itemsPerColumn),
                  ),
                ),
              ],
            );
          } else {
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
    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFFF3B30).withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF3B30).withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: const Color(0xFFFF3B30).withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() => isExpanded = !isExpanded);
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF3B30),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF3B30).withOpacity(0.5),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          description,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.7),
                            height: 1.6,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
