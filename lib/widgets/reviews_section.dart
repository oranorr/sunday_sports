import 'package:flutter/material.dart';
import '../models/review.dart';
import '../services/sheets_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:developer';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final SheetsService _sheetsService = SheetsService();
  List<Review> _reviews = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    try {
      log('PROD DEBUG: Начинаем загрузку отзывов');
      final reviews = await _sheetsService.getReviews();
      log('PROD DEBUG: Получены отзывы: ${reviews.length}');
      if (mounted) {
        setState(() {
          _reviews = reviews;
          _reviews.shuffle();
          _isLoading = false;
        });
      }
    } catch (e) {
      log('PROD DEBUG: Ошибка загрузки отзывов: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Ошибка загрузки отзывов: $e';
        });
      }
      log('Error loading reviews: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Добавляем отладочную информацию, если отзывы пустые
    if (_reviews.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.red),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ОТЛАДОЧНАЯ ИНФОРМАЦИЯ (PROD)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              _errorMessage.isEmpty
                  ? 'Список отзывов пуст. Отзывы не были загружены, но ошибки не возникло.\nВозможно, проблема в доступе к Google Sheets или в отсутствии учетных данных.'
                  : _errorMessage,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = '';
                });
                _loadReviews();
              },
              child: const Text('Повторить загрузку'),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Отзывы',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 40),

          // Отзывы в 1 или 2 столбца в зависимости от ширины экрана
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 800;

              if (isWideScreen) {
                // Разделяем отзывы на две колонки
                final int halfLength = (_reviews.length / 2).ceil();

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildReviewsList(_reviews.sublist(0, halfLength)),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildReviewsList(_reviews.length > halfLength
                          ? _reviews.sublist(halfLength)
                          : []),
                    ),
                  ],
                );
              } else {
                return _buildReviewsList(_reviews);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList(List<Review> reviews) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return _buildReviewCard(review, index);
      },
    );
  }

  Widget _buildReviewCard(Review review, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с фото и именем
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Widget>(
                  future: review.buildPhoto(
                    width: 80, // Уменьшаем размер фото
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      log('Ошибка загрузки фото: ${snapshot.error}');
                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.error_outline,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    }

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: snapshot.data ??
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (review.profession.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          review.profession,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Оценки - адаптивный дизайн с Wrap
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildInfoCard(
                  'Оценка',
                  '${review.rating}/10',
                  Icons.star,
                ),
                _buildInfoCard(
                  'Изменились навыки?',
                  review.hasSocialProgress ? 'Да' : 'Нет',
                  review.hasSocialProgress ? Icons.thumb_up : Icons.thumb_down,
                ),
                _buildInfoCard(
                  'Эмоциональный вайб',
                  '${review.vibeRating}/10',
                  Icons.favorite,
                ),
                _buildInfoCard(
                  'Рекомендую',
                  review.wouldRecommend ? 'Да' : 'Нет',
                  review.wouldRecommend ? Icons.thumb_up : Icons.thumb_down,
                ),
              ],
            ),

            // Отзыв
            if (review.feedback.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Text(
                  review.feedback,
                  style: const TextStyle(
                    fontSize: 16, // Уменьшаем размер текста
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),
            ],

            // Улучшенные навыки
            if (review.improvedSkills.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Улучшенные навыки:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: review.improvedSkills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 12, // Уменьшаем размер текста
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms, delay: (index * 200).ms);
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.amber, size: 20),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 10, color: Colors.white70),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
