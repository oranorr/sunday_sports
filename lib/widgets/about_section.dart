import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // О формате секция
        Container(
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

              // Информационные карточки о формате игры
              Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFormatCard(
                      context,
                      'Постановка речи, аргументация.',
                      'Благодаря правилам и особенностям игры, участники вынуждены учиться формулировать свою точку зрения за краткий промежуток времени, будучи под пристальным вниманием других игроков. Если они хотят быть услышанными и понятыми, речь становится более лаконичной, аргументированной, ёмкой.',
                      Icons.people,
                    ),
                    _buildFormatCard(
                      context,
                      'Формиирование команд',
                      'Одна из особенностей этой игры — игроки не узнают роли только что покинувших участников, только в конце игры. Это создает почву для бесконечной паранойи по отношению к Городу. Но победа мирных игроков невозможна без их объединения. Этот формат создает условия для того, чтобы участники учились находить среди неизвестности тех, кому можно доверять, и с кем "играть".',
                      Icons.people,
                    ),
                    _buildFormatCard(
                      context,
                      'Анализ речей.',
                      'Поскольку у игроков отсутствует какое-либо вещественное доказательство своей роли, игра вынуждает их играть "по позиции": кого они считают Мафией, а кого — мирным игроком. Игра учит анализировать речи, выделять в них ключевые моменты, выявлять намеки на ложь.',
                      Icons.people,
                    ),
                    _buildFormatCard(
                      context,
                      'Эмпатия, эмоциональный интеллект.',
                      'Из-за частых ситуаций неопределённости за игровым столом, участники развивают навыки чтения невербальных сигналов — от анализа эмоций и микромимики до техник переговоров и убеждения.',
                      Icons.people,
                    ),
                    _buildFormatCard(
                      context,
                      'Стрессоустойчивость и адаптивность.',
                      'Игра проходит в условиях высокой неопределённости и давления со стороны других игроков. Участники учатся быстро адаптироваться к изменяющимся обстоятельствам, сохранять хладнокровие и действовать осознанно даже под стрессом.',
                      Icons.bolt,
                    ),

                    _buildFormatCard(
                      context,
                      'Критическое мышление и логика.',
                      'Игра заставляет анализировать информацию, сопоставлять факты и выявлять несостыковки в речах других игроков. Это развивает навыки критического мышления и способность логически выстраивать аргументы.',
                      Icons.lightbulb,
                    ),

                    // _buildFormatCard(
                    //   context,
                    //   'Длительность игры',
                    //   'Одна игра занимает 30-40 минут. За вечер мы успеваем провести 3-4 полноценные игры, что позволяет участникам полностью погрузиться в процесс и получить максимальный опыт.',
                    //   Icons.access_time,
                    // ),
                    // _buildFormatCard(
                    //   context,
                    //   'Количество участников',
                    //   'Оптимальное количество участников - 10 человек. Это обеспечивает идеальный баланс между динамикой игры и возможностью каждого участника проявить себя.',
                    //   Icons.people,
                    // ),
                    // _buildFormatCard(
                    //   context,
                    //   'Как проходит игра',
                    //   'Игра состоит из нескольких раундов обсуждения, где каждый участник получает возможность высказаться в отведенное время. Ведущий направляет процесс и помогает участникам раскрыть свой потенциал.',
                    //   Icons.sports_esports,
                    // ),
                    // _buildFormatCard(
                    //   context,
                    //   'Подготовка к игре',
                    //   'Специальная подготовка не требуется. Перед началом игры мы проводим подробный инструктаж, объясняем все правила и механики.',
                    //   Icons.school,
                    // ),
                    // _buildFormatCard(
                    //   context,
                    //   'Что такое "спортивная" мафия',
                    //   'Спортивная (или московская) мафия - это современная версия классической игры с более строгими правилами и усовершенствованной механикой. Название "спортивная" отражает четкую структуру и регламент игры.',
                    //   Icons.sports,
                    // ),
                    // _buildFormatCard(
                    //   context,
                    //   'Что входит в игровой вечер',
                    //   'Игровой вечер включает подробный инструктаж по правилам, 3-4 игры с разным составом участников, и по желанию - разбор полетов с рекомендациями по улучшению игровых навыков.',
                    //   Icons.event,
                    // ),
                  ],
                ),
              ),

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
              ).animate().fadeIn(duration: 800.ms),
            ],
          ),
        ),

        // Частые вопросы секция
        Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Column(
            children: [
              Text(
                'Частые вопросы',
                style: GoogleFonts.raleway(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
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
                        question:
                            'У нас был негативный опыт этой игры, стоит ли пробовать снова?',
                        answer:
                            'Мы понимаем ваше беспокойство. Каждый игровой формат подходит не всем, и это абсолютно нормально. В отличие от профессиональных турниров, мы фокусируемся на создании комфортной атмосферы и получении удовольствия от игры. Наша цель - помочь участникам раскрыться, лучше узнать друг друга и провести время с пользой.',
                      ),
                      _FAQItem(
                        question: 'Что нужно для игры?',
                        answer:
                            'Для игры нам нужно только подходящее пространство - идеально подойдет конференц-зал или другое помещение, где участники смогут комфортно расположиться и не будут отвлекаться на посторонний шум. Мы привозим с собой все необходимое оборудование и материалы.',
                      ),
                      _FAQItem(
                        question:
                            'В чем именно заключается тренажер социальных навыков?',
                        answer:
                            'Игра служит эффективным тренажером социальных навыков благодаря своей структуре. Каждый участник получает строго ограниченное время для высказывания, что учит формулировать мысли четко и лаконично. В процессе игры развиваются навыки публичных выступлений, анализа информации, командной работы и принятия решений в условиях неопределенности - навыки, которые сложно развить в повседневной жизни.',
                      ),
                      _FAQItem(
                        question: 'Какие правила используются в игре?',
                        answer:
                            'Мы используем адаптированную версию правил спортивной мафии, которая сохраняет всю глубину игровой механики, но делает процесс более комфортным и приятным для всех участников. Например, мы не применяем строгих санкций за неформальную лексику.',
                      ),
                    ];

                    if (isWideScreen) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children:
                                  faqItems.sublist(0, faqItems.length ~/ 2),
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
        ),
      ],
    );
  }

  Widget _buildFormatCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 10,
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
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: colorScheme.onSurface.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3);
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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.red,
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
                  color: Colors.white.withOpacity(0.9),
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
