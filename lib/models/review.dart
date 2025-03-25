import 'package:flutter/material.dart';

import '../services/asset_image_service.dart';

class Review {
  final String name;
  final String profession;
  final int rating;
  final List<String> improvedSkills;
  final String feedback;
  final String? photoUrl;
  final bool hasSocialProgress;
  final bool wouldRecommend;
  final int vibeRating;

  Review({
    required this.name,
    required this.profession,
    required this.rating,
    required this.improvedSkills,
    required this.feedback,
    this.photoUrl,
    this.hasSocialProgress = false,
    this.wouldRecommend = false,
    required this.vibeRating,
  });

  Future<Widget> buildPhoto({
    double? width,
    double? height,
    BoxFit? fit,
    Widget? placeholder,
    Widget? errorWidget,
  }) async {
    return AssetImageService.instance.buildImage(
      photoUrl ?? '',
      width: width,
      height: height,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
    );
  }

  factory Review.fromSheetRow(Map<String, dynamic> row) {
    // Преобразование строки навыков в список
    List<String> parseSkills(String? skillsStr) {
      if (skillsStr == null || skillsStr.isEmpty) return [];
      if (skillsStr.contains('Лаконичность речи')) {
        skillsStr = 'Лаконичность речи';
      }
      return skillsStr.split(', ').where((skill) => skill.isNotEmpty).toList();
    }

    return Review(
      name: row['Как вас зовут? ']?.toString().trim() ?? '',
      profession: row['Кстати, кем вы работаете?']?.toString().trim() ?? '',
      rating: int.tryParse(row['Начнем с простого. Насколько вам понарвилось?']
                  ?.toString() ??
              '0') ??
          0,
      improvedSkills: parseSkills(
          row['Как вы думаете, какие навыки вы подкачали за столом? ']
              ?.toString()),
      feedback:
          row['Наконец, самое сложное. Вы могли бы написать полноценный текстик длинной порядка 500 символов, о том как вам эти игры и как они на вас повлияли? Очень было бы круто услышать именно истории о том, как изменились ваши социальные навыки и так далее. Если приплетете сюда свою работу — будет супер круто. ']
                  ?.toString()
                  .trim() ??
              '',
      photoUrl:
          row['При демонстрации ваших отзывов было бы неплохо использовать какие-то ваши реальные фотки. Поделитесь пожалуйста :) ']
              ?.toString()
              .trim(),
      hasSocialProgress:
          row['Ощутили ли вы какие-то изменения после игр в своем мышлении и/или социальном поведении и/или вербальном общении?']
                  ?.toString() ==
              'Да',
      wouldRecommend:
          row['Порекомендовали ли бы вы эти игры своим друзьям?']?.toString() ==
              'Да, конечно (уже)',
      vibeRating: int.tryParse(
              row['Как вы оценили бы эмоциональную атмосферу, царившую за нашими столами?']
                      ?.toString() ??
                  '0') ??
          0,
    );
  }
}
