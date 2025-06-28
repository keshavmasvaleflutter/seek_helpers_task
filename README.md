# seek_helpers_task

# Flutter User Management App

A Flutter application that demonstrates responsive UI design, state management, and REST API integration. The app fetches and displays a list of users from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/users), allows viewing user details, and provides a form to add new users locally.

---

## 🚀 Features

- **User List:** Displays users in a responsive grid or list layout.
- **User Details:** Shows detailed, structured information for each user.
- **Add New User:** Clean form for adding users (locally, not persisted to API).
- **Responsive Design:** Adapts to mobile, tablet, and desktop screens.
- **Search Functionality:** Filter users by name with instant search.
- **Error Handling:** Gracefully handles API failures and empty states.
- **Navigation:** Smooth page transitions and animations.
- **State Management:** Uses the `provider` package for clean state separation.

---

## 🛠️ Technical Overview

- **State Management:** [provider](https://pub.dev/packages/provider) (and optionally [flutter_riverpod](https://pub.dev/packages/flutter_riverpod))
- **API Integration:** [http](https://pub.dev/packages/http) package, connecting to JSONPlaceholder REST API
- **UI:** Material 3 design, responsive widgets
- **Navigation:** Flutter Navigator with custom transition animations

---

## 📦 Project Structure

```
lib/
├── models/            # Data models (e.g., user.dart)
├── providers/         # State management (e.g., user_provider.dart)
├── screens/           # UI screens (list, details, add user)
├── services/          # API services (e.g., user_service.dart)
├── widgets/           # Reusable UI components
├── main.dart          # App entry point
```

---

## 📲 Setup Instructions

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable)
- Dart SDK (comes with Flutter)
- IDE: Android Studio, VS Code, or IntelliJ IDEA with Flutter plugin

### Installation

1. **Clone the repository:**
    ```bash
    git clone [repository-url]
    ```
2. **Navigate to the project directory:**
    ```bash
    cd flutter-user-management-app
    ```
3. **Install dependencies:**
    ```bash
    flutter pub get
    ```

### Running the App

- **Debug mode:**
    ```bash
    flutter run
    ```
- **Release build (Android APK):**
    ```bash
    flutter build apk --release
    ```

---

## 📚 Dependencies

```yaml
provider: ^6.0.5
http: ^0.13.5
flutter_riverpod: ^2.4.9    # (optional, if Riverpod is used)
equatable: ^2.0.5           # (optional, for value equality)
```

---

## 🖼️ Screenshots

<!-- Add your actual screenshots below -->
| User List | User Details | Add User Form |
|-----------|--------------|---------------|
| ![List](screenshots/user_list.png) | ![Details](screenshots/user_details.png) | ![Add](screenshots/add_user.png) |

---

## 🎁 Bonus Features

- Search bar to filter users by name
- Animations for smooth page transitions
- Loading indicators and error messages for API calls

---

## ⚠️ Known Issues

- None currently

---

## 🚧 Future Improvements

- Implement pull-to-refresh functionality
- Add user editing and deletion
- Implement proper API POST/PUT for user management
- Add dark mode support

---

## 👤 Author

- **[Your Name]**
- [Your Contact Information]
- [Your GitHub Profile]

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
