#!/bin/bash

# Установка набора ошибок, которые должны прерывать выполнение скрипта
set -e

echo "Начинаю сборку веб-приложения..."
# Сборка веб-приложения Flutter
flutter build web --release

echo "Удаляю ветку gh-pages если она существует..."
# Удаляем ветку gh-pages локально и удаленно, если она существует
git branch -D gh-pages || true
git push origin --delete gh-pages || true

echo "Создаю новую ветку gh-pages..."
# Создаем новую ветку gh-pages
git checkout -b gh-pages

echo "Очищаю ветку gh-pages..."
# Очищаем ветку, сохраняя только папку build/web
git rm -rf .
git clean -fxd

echo "Копирую содержимое папки build/web..."
# Копируем содержимое папки build/web в корень
cp -r build/web/* .
rm -rf build

echo "Коммичу изменения и пушу ветку gh-pages..."
# Добавляем все файлы, коммитим и пушим изменения
git add .
git commit -m "Публикация веб-приложения"
git push -f origin gh-pages

echo "Возвращаюсь на исходную ветку..."
# Возвращаемся на исходную ветку
git checkout -

echo "Публикация завершена успешно!"