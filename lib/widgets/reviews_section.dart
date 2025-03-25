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
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Colors.black, Colors.blueGrey],
          // ),
          ),
      child: Column(
        children: [
          Text(
            'Отзывы',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(duration: 1000.ms),
          const SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _reviews.length,
            itemBuilder: (context, index) {
              final review = _reviews[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<Widget>(
                        future: review.buildPhoto(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          if (snapshot.hasError) {
                            log('Ошибка загрузки фото: ${snapshot.error}');
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.error_outline,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          }

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: snapshot.data ??
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (review.profession.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                review.profession,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildInfoCard(
                                  'Оценка',
                                  '${review.rating}/10',
                                  Icons.star,
                                ),
                                SizedBox(width: 10),
                                _buildInfoCard(
                                  'Изменились ли ваше мышление или социальные навыки?',
                                  review.hasSocialProgress ? 'Да' : 'Нет',
                                  review.hasSocialProgress
                                      ? Icons.thumb_up
                                      : Icons.thumb_down,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                _buildInfoCard(
                                  'Эмоциональный вайб чек',
                                  '${review.vibeRating}/10',
                                  Icons.favorite,
                                ),
                                SizedBox(width: 10),
                                _buildInfoCard(
                                  'Порекомендую друзьям?',
                                  review.wouldRecommend ? 'Да' : 'Нет',
                                  review.wouldRecommend
                                      ? Icons.thumb_up
                                      : Icons.thumb_down,
                                ),
                              ],
                            ),
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
                                    fontSize: 19,
                                    color: Colors.white70,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                            if (review.improvedSkills.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              const Text(
                                'Улучшенные навыки:',
                                style: TextStyle(
                                  fontSize: 18,
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
                                        fontSize: 14,
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
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 1000.ms, delay: (index * 200).ms);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber, size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
