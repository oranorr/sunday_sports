import 'package:flutter/material.dart';
import 'dart:developer';

/// Сервис для работы с локальными изображениями
class AssetImageService {
  static AssetImageService? _instance;

  AssetImageService._();

  static AssetImageService get instance {
    _instance ??= AssetImageService._();
    return _instance!;
  }

  /// Извлекает ID файла из URL Google Drive
  String? extractFileId(String url) {
    try {
      // Извлекаем все что после знака =
      print(url);
      final fileId = url.split('=').last;
      log('Извлечен ID файла: $fileId');
      return fileId;
    } catch (e) {
      log('Ошибка извлечения ID файла из URL: $e');
      return null;
    }
  }

  /// Получает путь к изображению в ассетах по ID файла
  String? getAssetPath(String fileId) {
    final assetPath = 'assets/images/$fileId.jpg';
    log('Поиск изображения по пути: $assetPath');
    return assetPath;
  }

  /// Виджет для отображения изображения из ассетов
  Widget buildImage(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    final fileId = extractFileId(url);
    if (fileId == null) {
      log('Не удалось извлечь ID файла из URL: $url');
      return errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          );
    }

    final assetPath = getAssetPath(fileId);
    if (assetPath == null) {
      log('Не удалось найти изображение для ID: $fileId');
      return errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          );
    }

    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        log('Ошибка загрузки изображения: $error');
        return errorWidget ??
            Container(
              width: width,
              height: height,
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
      },
    );
  }
}
