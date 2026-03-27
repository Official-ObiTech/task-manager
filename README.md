# Task Manager App

## Overview

A simple and efficient task management mobile application built with Flutter.
This app allows users to create, update, delete, and search tasks, with persistent local storage.

---

## Features

* Add new tasks with title and description
* Edit existing tasks
* Mark tasks as completed
* Delete tasks with confirmation dialog
* Search tasks in real-time
* Persistent storage using Hive
* Clean and responsive UI

---

## Architecture

The app follows a **feature-based clean architecture** structure:

* `data` → Handles models and local storage (Hive)
* `presentation` → UI and state management

This separation ensures scalability, maintainability, and clean code organization.

---

## State Management

Riverpod is used for state management because:

* It provides a clean and testable approach
* It separates business logic from UI
* It improves scalability for larger applications

---

## Local Storage

Hive was used for local data persistence because:

* It is lightweight and fast
* No need for complex setup
* Works well for offline-first apps

---

## UI/UX Considerations

* Simple and intuitive interface
* Clear empty state when no tasks exist
* Visual feedback using Snackbars
* Task completion indicated with strikethrough text

---

## Challenges

* Managing state updates efficiently with Hive
* Structuring the app with clean architecture within a short time
* Ensuring smooth UX while keeping the implementation simple

---

## Assumptions

* Tasks are stored locally (no backend required)
* Internet connection is not required for app functionality

---

## Time Spent

Approximately 4–6 hours

---

## APK Download

[Download APK](PASTE_YOUR_GOOGLE_DRIVE_LINK_HERE)

---

## How to Run

```bash
flutter pub get
flutter run
```
