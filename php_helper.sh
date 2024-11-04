#!/bin/bash

# Название скрипта: PHP Developer Utility

# Описание: Этот скрипт предоставляет несколько полезных функций для PHP-разработчиков

# Функции:
# 1. Быстрое создание нового PHP-проекта с основной структурой каталогов
# 2. Запуск локального PHP-сервера с автоматическим обновлением при изменении файлов
# 3. Проверка синтаксиса PHP-файлов в текущем каталоге
# 4. Очистка кэша Composer и Symfony

# 1. Функция создания нового PHP-проекта
create_new_project() {
  local project_name=$1
  
  if [ -z "$project_name" ]; then
    echo "Пожалуйста, укажите имя проекта в качестве аргумента."
    return 1
  fi
  
  mkdir "$project_name"
  cd "$project_name"
  
  # Создание основной структуры каталогов
  mkdir -p src/{Controller,Entity,Repository,Service}
  mkdir -p templates
  mkdir -p public
  touch composer.json
  touch .env
  touch .gitignore
  
  echo "Новый PHP-проект '$project_name' создан."
}

# 2. Функция запуска локального PHP-сервера с автообновлением
start_local_server() {
  local document_root=${1:-"public"}
  
  echo "Запуск локального PHP-сервера..."
  php -S localhost:8000 -t "$document_root" & 
  
  echo "Сервер запущен. Нажмите Ctrl+C, чтобы остановить."
  
  # Отслеживание изменений в файлах и автоматическое обновление сервера
  while true; do
    inotifywait -e modify,create,delete,move -r .
    killall -HUP php
  done
}

# 3. Функция проверки синтаксиса PHP-файлов
check_php_syntax() {
  local directory=${1:-"."}
  
  echo "Проверка синтаксиса PHP-файлов в '$directory'..."
  
  # Рекурсивная проверка синтаксиса PHP-файлов в указанном каталоге
  for file in $(find "$directory" -type f -name "*.php"); do
    php -l "$file"
  done
  
  echo "Проверка синтаксиса завершена."
}

# 4. Функция очистки кэша Composer и Symfony
clear_caches() {
  echo "Очистка кэша Composer..."
  composer clear-cache
  
  echo "Очистка кэша Symfony..."
  php bin/console cache:clear
}

# Вывод списка доступных функций
echo "Доступные функции:"
declare -f | grep "^[a-z]" | cut -d" " -f3