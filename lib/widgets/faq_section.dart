import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sunday_sports/shared/extensions.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  final List<int> _expandedIndices = [];

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndices.contains(index)) {
        _expandedIndices.remove(index);
      } else {
        _expandedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final faqItems = [
      {
        'question': 'Сколько длится игра?',
        'answer':
            'Весь процесс занимает около 3 часов, включая вводную часть, 3-4 раунда игры и финальный разбор результатов.'
      },
      {
        'question': 'Где проходят тренинги?',
        'answer':
            'Тренинги проходят только в очном формате в вашем офисе в Санкт-Петербурге. Мы привозим все необходимые материалы с собой.'
      },
      {
        'question': 'Сколько человек может участвовать?',
        'answer':
            'По правилам и балансам игры — играют строго 10 человек. Существует возможность провести игру с 9 участниками, но это будет скорее тренировка, чем полноценная игра. Если у вас не набирается Стол, но хочется поиграть, свяжитесь с нами, и мы обсудим варианты.'
      },
      {
        'question': 'Нужна ли специальная подготовка?',
        'answer':
            'Нет, специальная подготовка не требуется. Все правила объясняются на месте, а формат игры интуитивно понятен.'
      },
      {
        'question': 'Какие навыки развивает игра?',
        'answer':
            'Игра развивает навыки коммуникации, распознавания эмоций, стратегического мышления, эмпатии и умения работать в условиях неопределенности.'
      },
      {
        'question': 'Как заранее подготовиться к игре?',
        'answer':
            'Специальной подготовки не требуется. Мы рекомендуем участникам прийти с открытым умом и готовностью к активному взаимодействию.'
      },

      // {
      //   'question': 'Можно ли адаптировать игру под нашу компанию?',
      //   'answer':
      //       'Да, мы можем скорректировать сценарии и акценты игры под ваши бизнес-задачи — например, усилить отработку аргументации, командной работы или переговорных навыков.'
      // },
      {
        'question': 'Что делать, если у нас больше 10 человек?',
        'answer':
            'Мы можем организовать несколько параллельных игр или ротацию участников, чтобы каждый смог поучаствовать. Обсудим детали индивидуально.'
      },

      {
        'question': 'Можно ли заказать игру в другой город?',
        'answer':
            'На данный момент мы проводим игры только в Санкт-Петербурге, но готовы рассмотреть индивидуальные запросы.'
      },
      {
        'question': 'Подходит ли эта игра для новичков?',
        'answer':
            'Да, даже если у вас нет опыта в подобных играх, мы подробно объясним правила и проведем вводную сессию, чтобы каждый комфортно включился в процесс.'
      },
      {
        'question':
            'Можно ли заказать игру для закрытого корпоративного мероприятия?',
        'answer':
            'Да, мы проводим игры как отдельное корпоративное событие, включая частные мероприятия и тимбилдинги. Свяжитесь с нами для обсуждения формата.'
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: context.isSmallScreen ? 50 : 80,
          horizontal: context.isSmallScreen ? 15 : 20),
      color: colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Часто задаваемые вопросы',
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
          ).animate().fadeIn(duration: 800.ms),
          SizedBox(height: context.isSmallScreen ? 40 : 60),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final isExpanded = _expandedIndices.contains(index);

                return _buildFAQItem(
                  context: context,
                  question: faqItems[index]['question']!,
                  answer: faqItems[index]['answer']!,
                  isExpanded: isExpanded,
                  onTap: () => _toggleExpand(index),
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem({
    required BuildContext context,
    required String question,
    required String answer,
    required bool isExpanded,
    required VoidCallback onTap,
    required int index,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isExpanded ? colorScheme.primary : Colors.white.withOpacity(0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(context.isSmallScreen ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: GoogleFonts.montserrat(
                          fontSize: context.isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.remove_circle : Icons.add_circle,
                      color: isExpanded ? colorScheme.primary : Colors.white,
                      size: context.isSmallScreen ? 24 : 28,
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  SizedBox(height: context.isSmallScreen ? 12 : 16),
                  Text(
                    answer,
                    style: GoogleFonts.montserrat(
                      fontSize: context.isSmallScreen ? 14 : 16,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.6,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(
          duration: 800.ms,
          delay: Duration(milliseconds: 100 * index),
        );
  }
}
