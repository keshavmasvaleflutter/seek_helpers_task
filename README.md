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
- **State Management:** Uses the Bloc package for clean state managment.

---

## 🛠️ Technical Overview

- **State Management:** Bloc
- **API Integration:** [http](https://pub.dev/packages/http) package, connecting to JSONPlaceholder REST API
- **UI:** Material 3 design, responsive UI design
- **Navigation:** Flutter Navigator with custom transition animations
- **Theme:** Light and Dark Theme Change Available

---

## 📦 Project Structure

```
lib/
├── core/ 
├── view/  
├── features/  
├── app_router/  
├── main.dart          # App entry point
```

---

## 📲 Setup Instructions

### Prerequisites

Flutter 3.29.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ea121f8859 (3 months ago) • 2025-04-11 19:10:07 +0000
Engine • revision cf56914b32
Tools • Dart 3.7.2 • DevTools 2.42.3

### Installation

1. **Clone the repository:**
    ```bash
    git clone:- https://github.com/keshavmasvaleflutter/seek_helpers_task.git
    ```

### Running the App

- **Debug mode:**
    ```bash
    flutter run
    ```
- **Release build:**
    ```bash
    flutter build apk --release
    ```

---

## 🖼️ Screenshots

<!-- Add your actual screenshots below -->
| User List | User Details | Add User Form |
|-----------|--------------|---------------|
| ![List](screenshots/user_list.png) | ![Details](screenshots/user_details.png) | ![Add](screenshots/add_user.png) |

---

## 🎁 Bonus Features

- Search bar to filter users
- Animations for smooth page transitions
- Loading indicators and error messages for API calls
- Theme Change options

---

## 👤 Author

- **Keshav Masvale**
- Mo. No.:- 9657546519
