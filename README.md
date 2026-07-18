# 🪙 CoinDeck

CoinDeck is a Flutter-based coin flip game developed as a take-home assignment. It demonstrates clean architecture, GetX state management, Hive local storage, reusable UI components, and a scalable project structure.

---

## ✨ Features

- 🔐 User Registration & Login
- 💾 Persistent Login Session
- 💰 Wallet Management
- 🪙 Coin Flip Game
- 📜 Bet History
- ⚡ Fast Local Storage using Hive
- 🎨 Clean & Reusable UI Components
- 📱 Android & iOS Support

---

## 📸 Screens

- Splash Screen
- Login
- Register
- Home Dashboard
- Coin Flip Game
- Bet History

---

## 🏗️ Project Architecture

```
lib/
├── app/
│   ├── bindings/
│   ├── routes/
│   └── theme/
│
├── core/
│   ├── constants/
│   ├── enums/
│   └── games/
│
├── data/
│   ├── local/
│   ├── models/
│   └── repositories/
│
├── modules/
│   ├── splash/
│   ├── login/
│   ├── register/
│   ├── home/
│   ├── coin_flip/
│   └── history/
│
├── services/
│
└── widgets/
```

---

## 🛠️ Tech Stack

- Flutter
- Dart
- GetX
- Hive
- UUID
- Intl

---

## 📦 Packages Used

| Package | Purpose |
|----------|---------|
| get | State Management, Dependency Injection & Navigation |
| hive | Local NoSQL Database |
| hive_flutter | Flutter integration for Hive |
| uuid | Generate unique IDs |
| intl | Date & Time Formatting |
| path_provider | Storage Directory |
| flutter_launcher_icons | Generate App Icons |
| flutter_native_splash | Native Splash Screen |

---

## 📂 Architecture

This project follows a layered architecture:

```
View
   │
Controller
   │
Service
   │
Repository
   │
Hive Database
```

### Responsibilities

- **View** → Displays UI
- **Controller** → Manages UI State
- **Service** → Business Logic
- **Repository** → Data Access
- **Hive** → Local Storage

---

## 🚀 Getting Started

### 1. Clone the project

```bash
git clone <repository-url>
```

### 2. Move into the project

```bash
cd coin_deck
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Generate Hive files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Run the application

```bash
flutter run
```

---

## 📱 Build Release APK

```bash
flutter build apk --release
```

---

## 📌 Highlights

- Feature-first Folder Structure
- Clean Architecture
- Repository Pattern
- Service Layer
- Dependency Injection using GetX
- Reactive State Management
- Persistent Authentication
- Reusable Widgets
- Common Theme & Constants
- Offline Local Storage

---

## 👨‍💻 Developer

**Ajay Kumar**

Flutter Developer

---

## 📄 License

This project was developed as a Flutter take-home assignment for learning and evaluation purposes.