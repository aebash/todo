import 'package:flutter/material.dart';
import 'package:todo/src/repositories/task_repository.dart';

import '../data/task.dart';

class TaskViewModel extends ChangeNotifier {
  late TaskRepository repository;

  late Stream<List<Task>> tasks;

  Future<void> initialize() async {
    repository = TaskRepository();
    tasks = repository.findNotDone();
  }

  void add(Task task) {
    repository.add(task);
  }

  finish(Task task) {
    repository.finish(task);
  }
}
