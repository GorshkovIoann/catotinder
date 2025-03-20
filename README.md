# Cat Tinder

**Cat Tinder** — это Flutter-приложение, позволяющее знакомиться с различными породами кошек в формате "свайптиндера". Пользователь может оценивать котиков с помощью свайпов или кнопок лайка/дизлайка, а также просматривать подробное описание породы на отдельном экране.
Найдите же своему котику пару.

---

## Функциональные возможности
  Выполнены все необходимые шаги согласно первому домашнему заданию
- **Главный экран:**
  - **Случайное изображение котика с названием породы:**  
    При запуске приложения отображается случайное изображение кота, полученное с The Cat API, и название его породы.
  - **Свайп-контроль:**  
    Пользователь может свайпнуть изображение влево или вправо. Свайп вправо (или нажатие кнопки лайк) увеличивает счётчик лайков, а любой свайп – загружает нового котика.
  - **Кнопки лайка и дизлайка:**  
    На экране расположены две отдельные кнопки для оценки изображения.
  - **Навигация:**  
    При нажатии на изображение открывается детальный экран с информацией о породе.

- **Экран с детальным описанием:**
  - **Отображение изображения и подробной информации:**  
    На детальном экране выводится то же изображение котика, а также полное описание породы (характеристики, темперамент, происхождение и др.), полученное из API.

---

## Технические детали

- **Интеграция с The Cat API:**  
  - Используется endpoint:  
    `https://api.thecatapi.com/v1/images/search?has_breeds=1&api_key=YOUR_API_KEY`  
    (API-ключ передаётся в запросе)
  - Приложение получает изображение кота только, если в ответе присутствует информация о породе.

- **Используемые пакеты и виджеты:**
  - `http` — для выполнения HTTP-запросов.
  - `cached_network_image` — для загрузки и кэширования изображений.
  - **Navigator:** используется для перехода на детальный экран при нажатии на изображение.
  - **StatefulWidget:** главный экран реализован как StatefulWidget для управления состоянием (выбор нового котика, счётчик лайков).
  - **StatelessWidget:** кнопки лайка и дизлайка вынесены в отдельные компоненты.

- **Дизайн и стиль:**
  - Приложению задан красивый розовый фон, что улучшает визуальное восприятие.
  - Реализована кастомная иконка для приложения, сгенерированная с помощью пакета [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons).

- **Код и анализ:**
  - Код отформатирован с помощью `dart format`.
  - Используются правила линтинга, подключённые через [flutter_lints](https://pub.dev/packages/flutter_lints) (файл `analysis_options.yaml` включает `package:flutter_lints/flutter.yaml`).
  - Статический анализ (`flutter analyze`) проходит без ошибок.

---

## Реализованные требования

### Функциональные требования:
1. **Главный экран** отображает случайное изображение котика и название его породы.
2. **Свайп-контроль:** изображение можно свайпать влево или вправо.
3. **Две кнопки** — лайк и дизлайк, для оценки изображения.
4. **Обновление данных:** свайп или нажатие на кнопки загружает нового котика.
5. **Счётчик лайков:** при лайке (свайп вправо или кнопка лайк) увеличивается счётчик.
6. **Навигация по нажатию на изображение:** открывается детальный экран с информацией о породе.
7. **Детальный экран** отображает изображение котика и полное описание породы.

### Технические требования:
1. Использован пакет **http** для запросов к [The Cat API](https://thecatapi.com).
2. Данные получаются через endpoint `/v1/images/search` с параметром `has_breeds=1` и API-ключом.
3. Изображение загружается только, если присутствует информация о породе.
4. Для отображения изображений используется виджет **CachedNetworkImage**.
5. **Navigator** применяется для перехода на детальный экран.
6. Используются виджеты **Row** и **Column** для компоновки интерфейса.
7. Главный экран реализован как **StatefulWidget**.
8. Кнопки для лайка и дизлайка реализованы как **StatelessWidget**.
9. Приложению присвоена кастомная иконка.

---

## Интерфейс приложения

*(Пример скриншота главного экрана)*

![Main Screen](demo_png/png1.png)

*(Пример скриншота экрана деталей)*

![Details Screen](demo_png/png2.png)

---

## Ссылка на скачивание APK

Вы можете скачать последнюю версию APK по следующей ссылке:  
[Download Cat Tinder APK 1.0.0]([https://example.com/path/to/app-release.apk](https://drive.google.com/file/d/1tNPKbIzkfdqmuQJsSbGVEwRuHFDNv94H/view?usp=sharing))

---
