import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Цена, которая окупается в первые же недели',
            style: GoogleFonts.montserrat(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 900;

              if (isWideScreen) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPricingCard(
                      context,
                      title: 'Базовый пакет',
                      price: '35 000 ₽',
                      description: '10-15 человек',
                      isPrimary: true,
                    ),
                    const SizedBox(width: 30),
                    _buildPricingCard(
                      context,
                      title: 'Расширенный',
                      price: 'по запросу',
                      description: 'до 30 человек',
                      isPrimary: false,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildPricingCard(
                      context,
                      title: 'Базовый пакет',
                      price: '35 000 ₽',
                      description: '10-15 человек',
                      isPrimary: true,
                    ),
                    const SizedBox(height: 30),
                    _buildPricingCard(
                      context,
                      title: 'Расширенный',
                      price: 'по запросу',
                      description: 'до 30 человек',
                      isPrimary: false,
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.orange.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_offer,
                  color: Colors.orange,
                  size: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  'Первая игра для компании – скидка 10%!',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 1000.ms, delay: 500.ms),
        ],
      ),
    );
  }

  Widget _buildPricingCard(
    BuildContext context, {
    required String title,
    required String price,
    required String description,
    required bool isPrimary,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 350,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isPrimary
            ? colorScheme.primary.withOpacity(0.2)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              isPrimary ? colorScheme.primary : Colors.white.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(
                Icons.currency_ruble,
                color: isPrimary ? colorScheme.secondary : Colors.white70,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                price,
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: isPrimary ? colorScheme.secondary : Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (isPrimary) ...[
            _buildFeatureItem('Вводная часть'),
            _buildFeatureItem('3-4 игры с разбором'),
            _buildFeatureItem('Ведущий-профессионал'),
          ] else ...[
            _buildFeatureItem('Все преимущества базового'),
            _buildFeatureItem('Больше участников'),
            _buildFeatureItem('Индивидуальные условия'),
          ],
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // TODO: Добавить прокрутку к форме контактов
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isPrimary
                  ? colorScheme.secondary
                  : Colors.white.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Оставить заявку',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 1000.ms, delay: isPrimary ? 0.ms : 300.ms)
        .slideY(begin: 0.2);
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
