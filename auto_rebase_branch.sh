#!/bin/bash

# Автоматический скрипт для rebase, создания ветки и пуша изменений

set -e  # Прерывать выполнение при ошибках



echo "Начинаю автоматический rebase и создание ветки..."

# Шаг 1: Rebase на origin/master
echo "Выполняю rebase на origin/master..."
git fetch origin
git rebase origin/master

# Шаг 2: Генерируем случайное число от 100 до 1000
RANDOM_NUM=$((RANDOM % 901 + 100))
BRANCH_NAME="feature-branch-$RANDOM_NUM"

echo "Создаю новую ветку: $BRANCH_NAME"

# Шаг 3: Создаем новую ветку
git checkout -b $BRANCH_NAME

# Шаг 4: Вносим изменения в файл (если файла нет, создаем его)
CHANGE_FILE="changes.txt"
echo "Вношу изменения в файл $CHANGE_FILE..."

# Добавляем случайное количество символов
RANDOM_CHARS=$((RANDOM % 50 + 10))
RANDOM_CONTENT=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $RANDOM_CHARS)
echo "$RANDOM_CONTENT" >> $CHANGE_FILE

# Добавляем timestamp для уникальности
echo "$(date): Изменения в ветке $BRANCH_NAME" >> $CHANGE_FILE

# Шаг 5: git add .
echo "Добавляю файлы в git..."
git add .

# Шаг 6: git commit с случайным сообщением
COMMIT_MSG="Auto commit for branch $BRANCH_NAME - $(date)"
echo "Делаю коммит: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Шаг 7: git push новой ветки
echo "Отправляю ветку $BRANCH_NAME на удаленный репозиторий..."
git push -u origin $BRANCH_NAME

# Шаг 8: git checkout master
echo "Переключаюсь обратно на master..."
git checkout master

echo "Готово! Ветка $BRANCH_NAME создана и отправлена на удаленный репозиторий."
echo "Изменения добавлены в файл $CHANGE_FILE"
echo "Коммит: $COMMIT_MSG"