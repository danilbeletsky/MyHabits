# MyHabits

Нативное iOS-приложение для учёта привычек: список задач, отметка выполнения и добавление новых записей. Написано на **SwiftUI**.

## Возможности

- Просмотр списка привычек на главном экране
- Отметка привычки как выполненной (иконка круга / галочки)
- Добавление новой привычки через отдельный экран с полем ввода
- Навигация между экранами через `NavigationStack`

> Данные хранятся только в памяти во время работы приложения. После перезапуска список привычек сбрасывается.

## Требования

- macOS с установленным **Xcode**
- Симулятор или устройство с **iOS 26.0** и выше (значение из настроек проекта)

## Запуск

1. Клонируйте репозиторий или откройте папку проекта.
2. Откройте в Xcode файл:
   ```
   MyHabits/MyHabits.xcodeproj
   ```
3. Выберите схему **MyHabits** и целевое устройство (симулятор iPhone).
4. Запустите проект (**⌘R**).

## Структура проекта

```
MyHabits/
├── MyHabits.xcodeproj          # Проект Xcode
└── MyHabits/
    ├── MyHabitsApp.swift       # Точка входа приложения
    ├── Screen/                 # Экраны и корневая навигация
    │   ├── AppNavigationView.swift
    │   ├── MainScreen.swift
    │   └── AddHabitScreen.swift
    ├── Coordinator/            # Навигация и колбэки
    │   └── Coordinator.swift
    ├── Service/                # Маршруты навигации
    │   └── SelectedScreen.swift
    ├── Cells/                  # Модели данных
    │   └── Cells.swift
    └── Assets.xcassets         # Иконка и цвета
```

## Архитектура

| Компонент | Путь | Назначение |
|-----------|------|------------|
| `AppNavigationView` | `Screen/` | Корневой `NavigationStack`, `environment(coordinator)` |
| `MainScreen` | `Screen/` | `List` с привычками, переключение выполнения, кнопка «Добавить» |
| `AddHabitScreen` | `Screen/` | `TextField`, кнопки «Добавить» и «Отменить» |
| `Coordinator` | `Coordinator/` | `@Observable` класс: `NavigationPath`, `goTo` / `back`, колбэк `addHabit` |
| `SelectedScreen` | `Service/` | Enum маршрутов: главный экран и экран добавления |
| `Cells` | `Cells/` | Модель привычки: `id`, `title`, `isCompletion` |

Навигация построена на **Coordinator** + `navigationDestination(for: SelectedScreen.self)`. Состояние списка привычек живёт в `@State` на `MainScreen`; при переходе на экран добавления координатор получает колбэк `addHabit`, который дописывает новую запись в массив.

## Технологии

- Swift 5
- SwiftUI (`NavigationStack`, `List`, `@Environment`, `@Observable`)
- Bundle ID: `BDD.MyHabits`
