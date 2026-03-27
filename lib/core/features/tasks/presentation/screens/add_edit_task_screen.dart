import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class AddEditTaskScreen extends ConsumerStatefulWidget {
  final String? taskId;
  final String? existingTitle;
  final String? existingDescription;

  const AddEditTaskScreen({
    super.key,
    this.taskId,
    this.existingTitle,
    this.existingDescription,
  });

  @override
  ConsumerState<AddEditTaskScreen> createState() =>
      _AddEditTaskScreenState();
}

class _AddEditTaskScreenState
    extends ConsumerState<AddEditTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.taskId != null) {
      titleController.text = widget.existingTitle ?? '';
      descriptionController.text = widget.existingDescription ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.taskId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Task" : "Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();

                if (title.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Title is required")),
                  );
                  return;
                }

                if (isEditing) {
                  ref.read(taskProvider.notifier).editTask(
                        widget.taskId!,
                        title,
                        description,
                      );
                } else {
                  ref.read(taskProvider.notifier).addTask(
                        title,
                        description,
                      );
                }

                Navigator.pop(context);
              },
              child: Text(isEditing ? "Update Task" : "Add Task"),
            )
          ],
        ),
      ),
    );
  }
}