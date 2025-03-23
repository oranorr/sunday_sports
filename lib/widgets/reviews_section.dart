import 'package:flutter/material.dart';
import '../models/review.dart';
import '../services/sheets_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final SheetsService _sheetsService = SheetsService();
  List<Review> _reviews = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    try {
      final reviews = await _sheetsService.getReviews();
      if (mounted) {
        setState(() {
          _reviews = reviews;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
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

    return Column(
      children: [
        Text(
          'Отзывы',
          style: Theme.of(context).textTheme.headlineMedium,
        ).animate().fadeIn(duration: 1000.ms),
        const SizedBox(height: 40),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _reviews.length,
          itemBuilder: (context, index) {
            final review = _reviews[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
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
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          if (review.profession.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              review.profession,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Понравилось на ${review.rating}/10!',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: review.hasSocialProgress
                                    ? Colors.green
                                    : Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Замечена ли динамика в социальном/вербальном общении: ${review.hasSocialProgress ? 'Да' : 'Нет'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: review.wouldRecommend
                                    ? Colors.blue
                                    : Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Порекомендовали бы: ${review.wouldRecommend ? 'Да' : 'Нет'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          if (review.improvedSkills.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: review.improvedSkills.map((skill) {
                                return Chip(
                                  label: Text(skill),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  labelStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                          if (review.feedback.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                review.feedback,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: 1.5,
                                    ),
                              ),
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
    );
  }
}
