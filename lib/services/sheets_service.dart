import 'dart:developer';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import '../models/review.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class SheetsService {
  // Константы для подключения к Google Sheets
  static const _spreadsheetId = '1Q11IbuXyKnW6Hp65h17Dw2Yh4OpmSJNwGcdf1ZwyulM';
  static const _sheetName = 'Ответы на форму (1)';

  // Область видимости для API
  static const _scopes = [SheetsApi.spreadsheetsReadonlyScope];

  // Ключи сервисного аккаунта
  static ServiceAccountCredentials? _credentials;

  // Инициализация учетных данных
  static Future<void> _initializeCredentials() async {
    if (_credentials == null) {
      try {
        // Пытаемся загрузить из файла (для разработки)
        final jsonString = await rootBundle
            .loadString('assets/sundaysports-d30634cd7cfa.json');
        final jsonMap = json.decode(jsonString);
        _credentials = ServiceAccountCredentials.fromJson(jsonMap);
        log('Учетные данные инициализированы из файла');
      } catch (e) {
        // В продакшене используем строку, закодированную Base64
        try {
          const String encodedCredentials = String.fromEnvironment(
              'GOOGLE_SHEETS_CREDENTIALS',
              defaultValue: '');

          if (encodedCredentials.isNotEmpty) {
            // Декодируем Base64 в JSON строку
            final jsonString = utf8.decode(base64.decode(encodedCredentials));
            final jsonMap = json.decode(jsonString);
            _credentials = ServiceAccountCredentials.fromJson(jsonMap);
            log('Учетные данные инициализированы из переменной окружения');
          } else {
            log('ОШИБКА: Переменная окружения GOOGLE_SHEETS_CREDENTIALS не установлена');
            throw Exception(
                'Не удалось инициализировать учетные данные: переменная окружения не задана');
          }
        } catch (envError) {
          log('ОШИБКА при инициализации учетных данных: $envError');
          throw Exception(
              'Не удалось инициализировать учетные данные: $envError');
        }
      }
    }
  }

  // Метод для получения отзывов из Google Sheets
  Future<List<Review>> getReviews() async {
    try {
      await _initializeCredentials();

      // Авторизация и создание клиента
      final client = await clientViaServiceAccount(_credentials!, _scopes);

      // Создание API-клиента для Sheets
      final sheetsApi = SheetsApi(client);

      // Получение данных из таблицы
      final response = await sheetsApi.spreadsheets.values.get(
        _spreadsheetId,
        '$_sheetName!A1:Q1000', // Диапазон ячеек для чтения
      );

      // Завершение работы клиента
      client.close();

      // Обработка полученных данных
      final values = response.values;
      if (values == null || values.isEmpty) {
        log('Нет данных в таблице');
        return [];
      }

      // Первая строка содержит заголовки
      final headers = values.first.map((e) => e.toString()).toList();

      // Преобразование строк в отзывы
      final reviews = <Review>[];
      for (var i = 1; i < values.length; i++) {
        final row = values[i];
        // Пропускаем пустые строки
        if (row.every((cell) => cell.toString().trim().isEmpty)) continue;

        // Создание Map с данными строки
        final Map<String, dynamic> rowData = {};
        for (var j = 0; j < row.length && j < headers.length; j++) {
          rowData[headers[j]] = row[j];
        }
        // Создание объекта Review из данных строки
        reviews.add(Review.fromSheetRow(rowData));
      }

      return reviews;
    } catch (e) {
      log('Ошибка при получении отзывов: $e');
      return [];
    }
  }
}
