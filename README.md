# Task Manager App

## Overview

The Task Manager App is a simple yet scalable mobile application built with Flutter. It allows users to manage daily tasks efficiently by providing core task management features such as creating, updating, deleting, and searching tasks.

The goal of this project is to demonstrate strong understanding of state management, local data persistence, clean architecture principles, and mobile UI/UX best practices.

---

## Features

* Create new tasks with title and description
* Edit existing tasks
* Mark tasks as completed/uncompleted
* Delete tasks with confirmation dialog
* Real-time search functionality
* Persistent local storage (data remains after app restart)
* Empty state UI when no tasks are available
* User feedback via Snackbars

---

## Architecture

The app follows a **feature-based clean architecture** structure:

* `data` → Handles models and local storage (Hive)
* `presentation` → UI and state management

This separation ensures scalability, maintainability, and clean code organization.

---

## State Management

The app uses Riverpod for state management.

Why Riverpod?
* Ensures separation of business logic from UI
* Provides reactive and predictable state updates
* Scales well for larger applications
* Easier to test and maintain compared to traditional approaches

---

## Local Storage

The app uses Hive for local data persistence.

Why Hive?
* Lightweight and fast (No SQL overhead)
* Works efficiently for offline-first applications
* Simple integration with Flutter
* Ideal for storing structured objects like tasks

---

## UI/UX Considerations

* Clean and minimal interface for better usability
* Consistent spacing and layout structure
* Visual feedback for user actions (Snackbars)
* Task completion visually indicated using strikethrough text
* Confirmation dialog to prevent accidental deletions
* Search input for quick task filtering

---

## Challenges

* Managing synchronization between Hive storage and Riverpod state
* Structuring the project with clean architecture within a limited timeframe
* Ensuring smooth user experience while maintaining simplicity

---

## Assumptions

* The application is fully offline (no backend integration required)
* Tasks are stored locally on the device
* No authentication is required for this version

---

## Time Spent

Approximately 4–6 hours

---

## APK Download

[Download APK](https://drive.google.com/file/d/1_IelF7o4J3hZabKIGzQoTsqBT4cugevd/view?usp=sharing)

---

## How to Run

```bash
flutter pub get
flutter run
```
