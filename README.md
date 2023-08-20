# Rick and Morty App

![iOS - 14.0+](https://img.shields.io/badge/iOS-14.0%2B-6488ea)

---

## О проекте

Проект был сделан в качестве тестового задания в компанию "**1221 systems**".

Необходимо было разработать приложение по открытому [API](https://rickandmortyapi.com/api) и по [техническому заданию](https://docs.google.com/document/d/1gU-dREAeJM_jQZ8Mo9j4LtpTgNW9gLw96xY9SgulbDY/edit)

Приложение состоит из трёх экранов:
- Launch Screen **(Storyboard)**
- Экран со списком персонажей **(UIKit programmatically)**
- Экран с подробной информацией о персонаже **(SwiftUI)**

## Архитектура

Использовался подход Clean architecture + MVVM (+ Coordinators)

## Используемые зависимости

- [R.swift](https://github.com/mac-cain13/R.swift) - для работы с ресурсами
- [Kingfisher](https://github.com/onevcat/Kingfisher) - для загрузки изображений

---

## Дизайн экранов
| Launch Screen | Characters Screen | Character Details Screen |
| :------------:|:-----------: | :-------------: |
| <img src="https://i.postimg.cc/nzVcTf6S/Simulator-Screen-Shot-IPhone-12-mini-2023-08-20-at-16-42-53.png" width = 400> | <img src="https://i.postimg.cc/g2dJrhgP/Simulator-Screen-Shot-IPhone-12-mini-2023-08-20-at-16-42-56.png" width = 400> | <img src="https://i.postimg.cc/9FPX3MCg/Simulator-Screen-Shot-IPhone-12-mini-2023-08-20-at-16-42-58.png" width = 400> |
