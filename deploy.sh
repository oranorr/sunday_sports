#!/bin/bash

# Установка набора ошибок, которые должны прерывать выполнение скрипта
set -e

# Сохраняем текущую ветку
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)
echo "Текущая ветка: $CURRENT_BRANCH"

# Убедимся, что рабочая область чиста
# if [[ -n $(git status --porcelain) ]]; then
#   echo "Ошибка: есть несохраненные изменения. Сначала сделайте коммит или стэш."
#   exit 1
# fi

echo "Начинаю сборку веб-приложения..."
# Сборка веб-приложения Flutter
flutter build web --release

echo "Создаю временную директорию..."
# Создаем временную директорию и копируем туда собранные файлы
TEMP_DIR=$(mktemp -d)
cp -r build/web/* $TEMP_DIR/

echo "Переключаюсь на ветку gh-pages..."
# Проверяем существование ветки gh-pages
if git show-ref --verify --quiet refs/heads/gh-pages; then
  git checkout gh-pages
else
  git checkout --orphan gh-pages
fi

echo "Очищаю ветку gh-pages..."
# Удаляем все файлы в ветке
git rm -rf . || true

echo "Копирую собранные файлы..."
# Копируем собранные файлы из временной директории
cp -r $TEMP_DIR/* .

echo "Добавляю файлы в индекс..."
# Добавляем все файлы и создаем коммит
git add .
git commit -m "Публикация веб-приложения $(date +'%Y-%m-%d %H:%M:%S')"

echo "Пушу изменения в ветку gh-pages..."
# Пушим изменения
git push -f origin gh-pages

echo "Удаляю временную директорию..."
# Удаляем временную директорию
rm -rf $TEMP_DIR

echo "Возвращаюсь на исходную ветку..."
# Возвращаемся на исходную ветку
git checkout $CURRENT_BRANCH

echo "Публикация завершена успешно!"