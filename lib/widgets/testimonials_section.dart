import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Testimonial {
  final String name;
  final String text;
  final String imageUrl;

  Testimonial({
    required this.name,
    required this.text,
    required this.imageUrl,
  });
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      Testimonial(
        name: 'Анна Петрова',
        text:
            'Отличный формат для тимбилдинга! Команда стала сплоченнее, а коммуникация улучшилась.',
        imageUrl: 'https://i.pravatar.cc/150?img=1',
      ),
      Testimonial(
        name: 'Михаил Иванов',
        text:
            'Спортивная мафия помогла нам лучше понимать друг друга и эффективнее работать в команде.',
        imageUrl: 'https://i.pravatar.cc/150?img=2',
      ),
      Testimonial(
        name: 'Елена Сидорова',
        text:
            'Неожиданно полезный опыт! Особенно понравилось развитие навыков аргументации.',
        imageUrl: 'https://i.pravatar.cc/150?img=3',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Отзывы участников',
            style: GoogleFonts.roboto(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 40),
          FlutterCarousel(
            items: testimonials
                .map((testimonial) =>
                    _buildTestimonialCard(context, testimonial))
                .toList(),
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context, Testimonial testimonial) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(testimonial.imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            testimonial.name,
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            testimonial.text,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2);
  }
}
