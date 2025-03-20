import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface,
            colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'О формате',
            style: GoogleFonts.raleway(
              fontSize: 42,
              fontWeight: FontWeight.w300,
              color: colorScheme.onSurface,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Спортивная мафия - это не просто игра, а мощный инструмент для развития soft skills вашей команды. В процессе игры участники учатся эффективно коммуницировать, аргументировать свою позицию и работать в команде.',
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: colorScheme.onSurface.withOpacity(0.9),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard(
                context,
                'Коммуникация',
                'Учитесь эффективно доносить свои мысли и слушать других',
                Icons.chat_bubble_outline,
                0,
              ),
              _buildSkillCard(
                context,
                'Аргументация',
                'Развивайте навыки убеждения и отстаивания своей позиции',
                Icons.psychology,
                200,
              ),
              _buildSkillCard(
                context,
                'Командная работа',
                'Учитесь находить себе команду, выстраивать доверительные отношения с ними, и побеждать.',
                Icons.group,
                400,
              ),
              _buildSkillCard(
                context,
                'Анализ и критическое мышление',
                'Учитесь анализировать информацию, критически мыслить и принимать взвешенные решения.',
                Icons.location_searching_rounded,
                400,
              ),
              _buildSkillCard(
                context,
                'Чтение невербальных сигналов',
                'Учитесь читать невербальные сигналы и понимать, что происходит на самом деле.',
                Icons.face_retouching_natural_outlined,
                400,
              ),
              _buildSkillCard(
                context,
                'Управление конфликтами',
                'Учитесь управлять конфликтами и находить компромиссы.',
                Icons.warning,
                400,
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            'Частые вопросы',
            style: GoogleFonts.raleway(
              fontSize: 42,
              fontWeight: FontWeight.w300,
              color: colorScheme.onSurface,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWideScreen = constraints.maxWidth > 800;
                final faqItems = [
                  _FAQItem(
                    question: 'Сколько времени длится игра?',
                    answer:
                        'Одна игра занимает 30-40 минут. За вечер мы успеваем провести 3-4 полноценные игры, что позволяет участникам полностью погрузиться в процесс и получить максимальный опыт.',
                  ),
                  _FAQItem(
                    question: 'Сколько человек может участвовать?',
                    answer:
                        'Оптимальное количество участников - 10 человек. Это обеспечивает идеальный баланс между динамикой игры и возможностью каждого участника проявить себя. При необходимости можно провести игру с 9 участниками, но это может немного повлиять на игровой баланс.',
                  ),
                  _FAQItem(
                    question: 'Нужна ли специальная подготовка?',
                    answer:
                        'Специальная подготовка не требуется. Перед началом игры мы проводим подробный инструктаж, объясняем все правила и механики. Опыт участия в подобных играх не обязателен - мы помогаем новичкам быстро освоиться и начать получать удовольствие от процесса.',
                  ),
                  _FAQItem(
                    question: 'Как проходит игра?',
                    answer:
                        'Игра состоит из нескольких раундов обсуждения, где каждый участник получает возможность высказаться в отведенное время. В процессе игры участники учатся анализировать информацию, аргументировать свою позицию и работать в команде. Ведущий направляет процесс и помогает участникам раскрыть свой потенциал.',
                  ),
                  _FAQItem(
                    question:
                        'Почему Мафия "спортивная"? Приседать надо будет?',
                    answer:
                        'Спортивная (или московская) мафия - это современная версия классической игры, которая включает более строгие правила и усовершенствованную механику. Эти правила делают игру глубже и интереснее, сохраняя при этом основную идею поиска "плохих" и обмана "хороших". Название "спортивная" отражает четкую структуру и регламент игры, а не физическую активность.',
                  ),
                  _FAQItem(
                    question: 'Какие правила этой игры?',
                    answer:
                        'Мы используем адаптированную версию правил спортивной мафии, которая сохраняет всю глубину игровой механики, но делает процесс более комфортным и приятным для всех участников. Например, мы не применяем строгих санкций за неформальную лексику. Подробные правила вы можете найти в специальном разделе на нашем сайте.',
                  ),
                  _FAQItem(
                    question:
                        'У нас или у наших знакомых был негативный опыт этой игры...',
                    answer:
                        'Мы понимаем ваше беспокойство. Каждый игровой формат подходит не всем, и это абсолютно нормально. В отличие от профессиональных турниров, мы фокусируемся на создании комфортной атмосферы и получении удовольствия от игры. Наша цель - помочь участникам раскрыться, лучше узнать друг друга и провести время с пользой. Мы уверены, что наш подход к игре поможет вам открыть для себя новую сторону мафии.',
                  ),
                  _FAQItem(
                    question: 'Что нужно для игры?',
                    answer:
                        'Для игры нам нужно только подходящее пространство - идеально подойдет конференц-зал или другое помещение, где участники смогут комфортно расположиться и не будут отвлекаться на посторонний шум. Мы привозим с собой все необходимое оборудование и материалы.',
                  ),
                  _FAQItem(
                    question:
                        'Что вообще входит в ваше понятие "игрового вечера"?',
                    answer:
                        'Игровой вечер включает в себя полноценный цикл обучения и игры: подробный инструктаж по правилам, 3-4 игры с разным составом участников, и по желанию - разбор полетов с рекомендациями по улучшению игровых навыков. Мы обеспечиваем плавное погружение в игру и помогаем каждому участнику раскрыть свой потенциал.',
                  ),
                  _FAQItem(
                    question: 'В чем именно тренажер?',
                    answer:
                        'Игра служит эффективным тренажером социальных навыков благодаря своей структуре. Каждый участник получает строго ограниченное время для высказывания, что учит формулировать мысли четко и лаконично. В процессе игры развиваются навыки публичных выступлений, анализа информации, командной работы и принятия решений в условиях неопределенности - навыки, которые сложно развить в повседневной жизни.',
                  ),
                ];

                if (isWideScreen) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: faqItems.sublist(0, faqItems.length ~/ 2),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: faqItems.sublist(faqItems.length ~/ 2),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: faqItems,
                  );
                }
              },
            ),
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
    int delayMs,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      width: 320,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withOpacity(isDark ? 0.15 : 0.1),
            colorScheme.primary.withOpacity(isDark ? 0.05 : 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.primary.withOpacity(isDark ? 0.2 : 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(isDark ? 0.1 : 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(isDark ? 0.1 : 0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 48,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.raleway(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: colorScheme.onSurface.withOpacity(0.9),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: 800.ms,
          delay: Duration(milliseconds: delayMs),
        )
        .slideY(begin: 0.3);
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withOpacity(isDark ? 0.2 : 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(isDark ? 0.1 : 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                widget.answer,
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: colorScheme.onSurface.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
