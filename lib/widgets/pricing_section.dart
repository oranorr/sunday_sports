import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sunday_sports/shared/extensions.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: context.isSmallScreen ? 50 : 80,
          horizontal: context.isSmallScreen ? 15 : 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Цена, которая окупается в первые же недели',
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
          ).animate().fadeIn(duration: 1000.ms),
          SizedBox(height: context.isSmallScreen ? 40 : 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;

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
                    SizedBox(width: context.isMediumScreen ? 20 : 30),
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
          SizedBox(height: context.isSmallScreen ? 30 : 40),
          Container(
            padding: EdgeInsets.all(context.isSmallScreen ? 15 : 20),
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
                  size: context.isSmallScreen ? 24 : 30,
                ),
                SizedBox(width: context.isSmallScreen ? 10 : 15),
                Flexible(
                  child: Text(
                    'Первая игра для компании – скидка 10%!',
                    style: GoogleFonts.montserrat(
                      fontSize: context.isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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
    final cardWidth =
        context.isSmallScreen ? MediaQuery.of(context).size.width - 40 : 350.0;

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(context.isSmallScreen ? 20 : 30),
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
              fontSize: context.isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.isSmallScreen ? 15 : 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(
                Icons.currency_ruble,
                color: isPrimary ? colorScheme.secondary : Colors.white70,
                size: context.isSmallScreen ? 24 : 30,
              ),
              SizedBox(width: context.isSmallScreen ? 3 : 5),
              Text(
                price,
                style: GoogleFonts.montserrat(
                  fontSize: context.isSmallScreen ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: isPrimary ? colorScheme.secondary : Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: context.isSmallScreen ? 10 : 15),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: context.isSmallScreen ? 8 : 10,
                horizontal: context.isSmallScreen ? 15 : 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: context.isSmallScreen ? 14 : 16,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(height: context.isSmallScreen ? 20 : 30),
          if (isPrimary) ...[
            _buildFeatureItem(context, 'Вводная часть'),
            _buildFeatureItem(context, '3-4 игры с разбором'),
            _buildFeatureItem(context, 'Ведущий-профессионал'),
          ] else ...[
            _buildFeatureItem(context, 'Все преимущества базового'),
            _buildFeatureItem(context, 'Больше участников'),
            _buildFeatureItem(context, 'Индивидуальные условия'),
          ],
          SizedBox(height: context.isSmallScreen ? 20 : 30),
          ElevatedButton(
            onPressed: () {
              // TODO: Добавить прокрутку к форме контактов
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isPrimary
                  ? colorScheme.secondary
                  : Colors.white.withOpacity(0.2),
              padding: EdgeInsets.symmetric(
                horizontal: context.isSmallScreen ? 30 : 40,
                vertical: context.isSmallScreen ? 15 : 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Оставить заявку',
              style: GoogleFonts.montserrat(
                fontSize: context.isSmallScreen ? 14 : 16,
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

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.isSmallScreen ? 6 : 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: context.isSmallScreen ? 16 : 20,
          ),
          SizedBox(width: context.isSmallScreen ? 8 : 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: context.isSmallScreen ? 14 : 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
