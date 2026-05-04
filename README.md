# 🤖 Mini Robo

<p align="center">
  <img src="assets/images/robot_happy.png" width="150" alt="Mini Robot"/>
</p>

<p align="center">
  A Flutter-based mobile application to control and interact with a mini robot via Wi-Fi.
</p>

---

## ✨ Features

- 🕺 **Dance Mode** — Make the robot dance with one tap
- 🎮 **Manual Movement** — Control the robot's arms and body manually
- 📷 **Face ID Registration** — Register a user's face for robot recognition
- 🔍 **Object Detection** — Activate the robot's object detection camera mode
- 👋 **Greeting Mode** — Trigger the robot's greeting behavior
- 📚 **Info Panel** — Send info commands (Flutter, IoT, AI, Media, ROV)

---

## 🏗️ Project Structure

```
lib/
├── main.dart
├── start_screen.dart
├── core/
│   ├── networking/
│   │   ├── api_constants.dart
│   │   ├── http_service.dart
│   │   └── http_repo.dart
│   └── utils/
│       └── app_colors.dart
├── logic/
│   ├── camera/
│   │   ├── camera_cubit.dart
│   │   └── camera_states.dart
│   └── movement/
│       ├── movement_cubit.dart
│       └── movement_states.dart
├── features/
│   ├── home/widgets/
│   │   └── home_screen.dart
│   ├── movement/widgets/
│   │   ├── movement_screen.dart
│   │   └── custom_switch.dart
│   ├── camera_screens/widgets/
│   │   ├── main_camera_screen.dart
│   │   ├── camera_modes_screen.dart
│   │   └── camera_file.dart
│   ├── information/widgets/
│   │   └── information_screen.dart
│   └── feedback/widgets/
│       └── feedback_screen.dart
└── shared/
    ├── buttons/
    │   ├── custom_button.dart
    │   ├── custom_glass_box.dart
    │   ├── custom_modes_buttons.dart
    │   └── custom_navigation_bottom.dart
    └── texts/
        ├── custom_text.dart
        ├── custom_textfield.dart
        └── custom_title.dart
```

---

## 🧠 Architecture

This project uses **BLoC (Cubit)** for state management with a clean separation between UI and logic.

```
UI  ──►  Cubit  ──►  HttpRepo  ──►  HttpService  ──►  Robot Server
          │
          └──► emits States  ──►  UI rebuilds
```

| Layer | Responsibility |
|-------|---------------|
| `HttpService` | Raw HTTP requests via Dio |
| `HttpRepo` | Business logic, image compression |
| `CameraCubit` | Camera feature states |
| `MovementCubit` | Movement feature states |

---

## 🌐 API

The app communicates with a Python server running on the robot via HTTP.

**Base URL:** `http://<robot-ip>:8000/flutter`

| Mode Header | Action |
|-------------|--------|
| `D` | Dancing |
| `G` | Greeting |
| `S` | Stop |
| `F` | Face Recognition |
| `O` | Object Detection |
| `ON` / `OFF` | Manual Mode Toggle |
| `MF`, `MB` | Move Forward / Backward |
| `LU`, `LD`, `RU`, `RD` | Arm movements |

> The IP address can be changed at runtime from the settings icon inside the app.

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.x       # State management
  dio: ^5.x                # HTTP client
  image_picker: ^1.x       # Camera & gallery access
  flutter_image_compress:  # Image compression before upload
  google_nav_bar:          # Bottom navigation bar
  gap:                     # Spacing utility
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Android / iOS device or emulator
- Mini Robot connected to the same Wi-Fi network

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/your-username/mini-robo.git
cd mini-robo

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

---

## 🎨 Design System

| Token | Value |
|-------|-------|
| Primary Color | `#86B4E5` (Light Blue) |
| Secondary Color | `#FFFFFF` |
| Text Color | `#434343` |
| Light Text | `#E5E7E9` |
| Icon Color | `#F29D38` (Orange) |

---


## 👥 Team

Built with ❤️ as part of a IOT + AI + Flutter project.

---