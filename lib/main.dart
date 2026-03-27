import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager_app/core/features/tasks/data/models/task_model.dart';
import 'package:task_manager_app/core/features/tasks/presentation/screens/task_list_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
 
  await Hive.initFlutter();
Hive.registerAdapter(TaskModelAdapter());
await Hive.openBox<TaskModel>('tasksBox');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      home: const TaskListScreen(),
    );
  }
}