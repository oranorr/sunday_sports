import 'package:flutter/material.dart';
import '../models/review.dart';
import '../services/sheets_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:developer';
import '../shared/extensions.dart';

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
      padding: EdgeInsets.symmetric(
          vertical: context.isSmallScreen ? 40 : 60,
          horizontal: context.isSmallScreen ? 15 : 20),
      child: Column(
        children: [
          Text(
            'Отзывы',
            style: TextStyle(
              fontSize: context.isSmallScreen
                  ? 32
                  : context.isMediumScreen
                      ? 36
                      : 42,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 1000.ms),
          SizedBox(height: context.isSmallScreen ? 25 : 40),

          // Отзывы в 1 или 2 столбца в зависимости от ширины экрана
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;

              if (isWideScreen) {
                // Разделяем отзывы на две колонки
                final int halfLength = (_reviews.length / 2).ceil();

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildReviewsList(_reviews.sublist(0, halfLength)),
                    ),
                    SizedBox(width: context.isMediumScreen ? 15 : 20),
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
    final photoSize = context.isSmallScreen ? 60.0 : 80.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: context.isSmallScreen ? 8 : 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с фото и именем
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Widget>(
                  future: review.buildPhoto(
                    width: photoSize,
                    height: photoSize,
                    fit: BoxFit.cover,
                    placeholder: Container(
                      width: photoSize,
                      height: photoSize,
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: Container(
                      width: photoSize,
                      height: photoSize,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(photoSize / 2),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: photoSize * 0.5,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(photoSize / 2),
                        child: snapshot.data!,
                      );
                    } else {
                      return Container(
                        width: photoSize,
                        height: photoSize,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(photoSize / 2),
                        ),
                        child: Center(
                          child: snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SizedBox(
                                  width: photoSize / 3,
                                  height: photoSize / 3,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.person,
                                  size: photoSize * 0.5,
                                  color: Colors.white54,
                                ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(width: context.isSmallScreen ? 10 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: TextStyle(
                          fontSize: context.isSmallScreen ? 16 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (review.profession.isNotEmpty) ...[
                        SizedBox(height: context.isSmallScreen ? 2 : 2),
                        Text(
                          review.profession,
                          style: TextStyle(
                            fontSize: context.isSmallScreen ? 13 : 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: context.isSmallScreen ? 12 : 16),

            // Оценки - адаптивный дизайн с Wrap
            Wrap(
              spacing: context.isSmallScreen ? 6 : 8,
              runSpacing: context.isSmallScreen ? 6 : 8,
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
              SizedBox(height: context.isSmallScreen ? 12 : 16),
              Container(
                padding: EdgeInsets.all(context.isSmallScreen ? 12 : 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Text(
                  review.feedback,
                  style: TextStyle(
                    fontSize: context.isSmallScreen ? 14 : 16,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),
            ],

            // Улучшенные навыки
            if (review.improvedSkills.isNotEmpty) ...[
              SizedBox(height: context.isSmallScreen ? 12 : 16),
              Text(
                'Улучшенные навыки:',
                style: TextStyle(
                  fontSize: context.isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: context.isSmallScreen ? 6 : 8),
              Wrap(
                spacing: context.isSmallScreen ? 6 : 8,
                runSpacing: context.isSmallScreen ? 6 : 8,
                children: review.improvedSkills.map((skill) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.isSmallScreen ? 10 : 14,
                      vertical: context.isSmallScreen ? 6 : 8,
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
                      style: TextStyle(
                        fontSize: context.isSmallScreen ? 11 : 12,
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
    ).animate().fadeIn(
          delay: Duration(milliseconds: 150 * index),
          duration: Duration(milliseconds: 800),
        );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(context.isSmallScreen ? 8 : 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: Colors.amber, size: context.isSmallScreen ? 16 : 20),
          SizedBox(width: context.isSmallScreen ? 4 : 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: context.isSmallScreen ? 9 : 10,
                    color: Colors.white70),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: context.isSmallScreen ? 12 : 14,
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
