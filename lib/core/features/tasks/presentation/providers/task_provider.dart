import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../data/models/task_model.dart';
import 'package:uuid/uuid.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((
  ref,
) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    loadTasks();
  }

  final box = Hive.box<TaskModel>('tasksBox');

  String searchQuery = '';

  void searchTasks(String query) {
    searchQuery = query;

    final allTasks = box.values.toList();

    if (query.isEmpty) {
      state = allTasks;
    } else {
      state = allTasks
          .where(
            (task) => task.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

  void loadTasks() {
    state = box.values.toList();
  }

  void addTask(String title, String description) {
    final newTask = TaskModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );

    box.put(newTask.id, newTask);
    state = [...state, newTask];
  }

  void toggleTask(String id) {
    final index = state.indexWhere((t) => t.id == id);
    final task = state[index];

    task.isCompleted = !task.isCompleted;
    task.save();

    state = [...state];
  }

  void deleteTask(String id) {
    box.delete(id);
    state = state.where((task) => task.id != id).toList();
  }

  void editTask(String id, String title, String description) {
    final index = state.indexWhere((t) => t.id == id);
    final task = state[index];

    task.title = title;
    task.description = description;
    task.save();

    state = [...state];
  }
}
