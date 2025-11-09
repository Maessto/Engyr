#!/bin/bash

# Скрипт для завантаження ENGYR проекту на GitHub
# Використання: ./deploy-to-github.sh

echo "🚀 Завантаження ENGYR на GitHub..."

# Перевірка чи ми в правильній директорії
if [ ! -f "index.html" ]; then
    echo "❌ Помилка: index.html не знайдено. Запустіть скрипт в папці проекту!"
    exit 1
fi

# Ініціалізація Git репозиторію
if [ ! -d ".git" ]; then
    echo "📦 Ініціалізація Git репозиторію..."
    git init
fi

# Налаштування Git (якщо потрібно)
if [ -z "$(git config user.name)" ]; then
    echo "⚙️  Налаштування Git..."
    read -p "Введіть ваше ім'я для Git: " git_name
    read -p "Введіть ваш email для Git: " git_email
    git config user.name "$git_name"
    git config user.email "$git_email"
fi

# Додавання всіх файлів
echo "📝 Додавання файлів..."
git add .

# Коміт
echo "💾 Створення коміту..."
git commit -m "Initial commit: ENGYR minimalist store"

# Перевірка чи є remote
if ! git remote | grep -q "origin"; then
    echo ""
    echo "🔗 Введіть URL вашого GitHub репозиторію:"
    echo "Формат: https://github.com/USERNAME/engyr.git"
    read -p "URL: " repo_url
    git remote add origin "$repo_url"
fi

# Перейменування гілки на main
git branch -M main

# Push на GitHub
echo "⬆️  Завантаження на GitHub..."
git push -u origin main

echo ""
echo "✅ Готово! Проект ENGYR завантажено на GitHub"
echo "🌐 Тепер можете підключити репозиторій до Netlify"
