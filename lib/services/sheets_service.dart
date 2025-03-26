import 'dart:developer';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/review.dart';

class SheetsService {
  // Путь к Excel файлу в ассетах
  static const _excelPath = 'assets/Отзывы на мафию.xlsx';

  // Метод для получения отзывов из Excel файла
  Future<List<Review>> getReviews() async {
    try {
      log('1. Начало метода getReviews()');

      // Загрузка Excel файла из ассетов
      final bytes = await rootBundle.load(_excelPath);
      final excel = Excel.decodeBytes(bytes.buffer.asUint8List());

      // Получаем первый лист
      final sheet = excel.tables.keys.first;
      final table = excel.tables[sheet]!;

      log('2. Excel файл успешно загружен');

      // Получаем заголовки из первой строки
      final headers =
          table.row(0).map((cell) => cell?.value.toString() ?? '').toList();
      log('3. Получены заголовки: ${headers.join(", ")}');

      // Преобразование строк в отзывы
      final reviews = <Review>[];

      // Начинаем со второй строки (индекс 1), так как первая строка - заголовки
      for (var rowIndex = 1; rowIndex < table.maxRows; rowIndex++) {
        final row = table.row(rowIndex);

        // Пропускаем пустые строки
        if (row.every((cell) =>
            cell?.value == null || cell!.value.toString().trim().isEmpty)) {
          continue;
        }

        // Создание Map с данными строки
        final Map<String, dynamic> rowData = {};
        for (var colIndex = 0;
            colIndex < row.length && colIndex < headers.length;
            colIndex++) {
          rowData[headers[colIndex]] = row[colIndex]?.value;
        }

        // Создание объекта Review из данных строки
        reviews.add(Review.fromSheetRow(rowData));
      }

      log('4. Всего обработано отзывов: ${reviews.length}');
      return reviews;
    } catch (e) {
      log('ОШИБКА при получении отзывов: $e');
      return [];
    }
  }
}
