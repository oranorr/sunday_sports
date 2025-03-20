import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Testimonial {
  final String name;
  final String text;
  final String imageUrl;
  final String position;

  Testimonial({
    required this.name,
    required this.text,
    required this.imageUrl,
    required this.position,
  });
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      Testimonial(
        name: 'Анна Петрова',
        position: 'HR-директор',
        text:
            'Отличный формат для тимбилдинга! Команда стала сплоченнее, а коммуникация улучшилась. Рекомендую всем, кто хочет укрепить командный дух.',
        imageUrl: 'https://i.pravatar.cc/150?img=1',
      ),
      Testimonial(
        name: 'Михаил Иванов',
        position: 'Руководитель отдела продаж',
        text:
            'Спортивная мафия помогла нам лучше понимать друг друга и эффективнее работать в команде. Отличный способ развить навыки коммуникации.',
        imageUrl: 'https://i.pravatar.cc/150?img=2',
      ),
      Testimonial(
        name: 'Елена Сидорова',
        position: 'Менеджер проектов',
        text:
            'Неожиданно полезный опыт! Особенно понравилось развитие навыков аргументации. После игры заметили улучшение в решении конфликтных ситуаций.',
        imageUrl: 'https://i.pravatar.cc/150?img=3',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        image: DecorationImage(
          image: NetworkImage(
              'https://www.transparenttextures.com/patterns/cubes.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.05,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Отзывы участников',
                  style: GoogleFonts.montserrat(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'Узнайте, что говорят участники о нашей спортивной мафии',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
              ],
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 400,
            child: FlutterCarousel(
              items: testimonials
                  .map((testimonial) =>
                      _buildTestimonialCard(context, testimonial))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context, Testimonial testimonial) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(testimonial.imageUrl),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            testimonial.name,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            testimonial.position,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            testimonial.text,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.95, 0.95));
  }
}
