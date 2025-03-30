import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sunday_sports/shared/extensions.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.isSmallScreen ? 40 : 60,
        horizontal: context.isSmallScreen ? 15 : 20,
      ),
      child: Column(
        children: [
          // Heading
          Text(
            'Остались вопросы?',
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

          SizedBox(height: context.isSmallScreen ? 10 : 20),

          // Subheading
          Text(
            'Свяжитесь с нами любым удобным способом',
            style: GoogleFonts.montserrat(
              fontSize: context.isSmallScreen ? 16 : 18,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: 800.ms, delay: 200.ms)
              .slideY(begin: 0.3),

          SizedBox(height: context.isSmallScreen ? 40 : 60),

          // Contact Methods
          LayoutBuilder(
            builder: (context, constraints) {
              if (context.isSmallScreen) {
                // Мобильная версия - в одну колонку
                return Column(
                  children: [
                    _buildContactMethod(
                      context,
                      icon: Icons.telegram,
                      title: 'Telegram',
                      description: 'Напишите нам в Telegram',
                      buttonText: 'Написать',
                      onTap: () => _launchUrl('https://t.me/your_telegram'),
                      delay: 0,
                    ),
                    SizedBox(height: 20),
                    _buildContactMethod(
                      context,
                      icon: Icons.phone_android,
                      title: 'Телефон',
                      description: '+7 (999) 123-45-67',
                      buttonText: 'Позвонить',
                      onTap: () => _launchUrl('tel:+79991234567'),
                      delay: 200,
                    ),
                    SizedBox(height: 20),
                    _buildContactMethod(
                      context,
                      icon: Icons.email_outlined,
                      title: 'Email',
                      description: 'info@sundaysports.ru',
                      buttonText: 'Написать',
                      onTap: () => _launchUrl('mailto:info@sundaysports.ru'),
                      delay: 400,
                    ),
                  ],
                );
              } else {
                // Десктопная версия - в ряд
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildContactMethod(
                        context,
                        icon: Icons.telegram,
                        title: 'Telegram',
                        description: 'Напишите нам в Telegram',
                        buttonText: 'Написать',
                        onTap: () => _launchUrl('https://t.me/your_telegram'),
                        delay: 0,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildContactMethod(
                        context,
                        icon: Icons.phone_android,
                        title: 'Телефон',
                        description: '+7 (999) 123-45-67',
                        buttonText: 'Позвонить',
                        onTap: () => _launchUrl('tel:+79991234567'),
                        delay: 200,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildContactMethod(
                        context,
                        icon: Icons.email_outlined,
                        title: 'Email',
                        description: 'info@sundaysports.ru',
                        buttonText: 'Написать',
                        onTap: () => _launchUrl('mailto:info@sundaysports.ru'),
                        delay: 400,
                      ),
                    ),
                  ],
                );
              }
            },
          ),

          SizedBox(height: 60),

          // Disclaimer text
          Text(
            '© 2023 Sunday Sports. Все права защищены.',
            style: GoogleFonts.montserrat(
              fontSize: context.isSmallScreen ? 12 : 14,
              color: Colors.white.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onTap,
    required int delay,
  }) {
    return Container(
      padding: EdgeInsets.all(context.isSmallScreen ? 20 : 30),
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
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.indigo.shade200,
              size: context.isSmallScreen ? 24 : 30,
            ),
          ),
          SizedBox(height: context.isSmallScreen ? 16 : 24),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: context.isSmallScreen ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.montserrat(
              fontSize: context.isSmallScreen ? 14 : 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: context.isSmallScreen ? 20 : 30),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade700,
              padding: EdgeInsets.symmetric(
                horizontal: context.isSmallScreen ? 16 : 24,
                vertical: context.isSmallScreen ? 12 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: GoogleFonts.montserrat(
                fontSize: context.isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(
          delay: Duration(milliseconds: delay),
          duration: 800.ms,
        );
  }
}
