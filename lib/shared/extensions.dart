import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Проверяет, является ли устройство маленьким (< 600px)
  bool get isSmallScreen => MediaQuery.of(this).size.width < 600;

  /// Проверяет, является ли устройство средним (600-900px)
  bool get isMediumScreen =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 900;

  /// Проверяет, является ли устройство большим (>= 900px)
  bool get isLargeScreen => MediaQuery.of(this).size.width >= 900;

  /// Возвращает размер экрана в виде текстовой константы
  String get screenSize {
    if (isSmallScreen) return 'small';
    if (isMediumScreen) return 'medium';
    return 'large';
  }
}
