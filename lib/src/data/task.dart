import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/views/home_screen.dart';

import '../repositories/task_repository.dart';

part 'task.freezed.dart';
part 'task.g.dart';

final formatter = DateFormat("yyyy-MM-dd HH:mm:ss");

/// flutter pub run build_runner build
@freezed
class Task with _$Task {
  const factory Task({
    String? id,
    required String? body,
    required bool isCompleted,
    // required DateTime createAt,
    // required DateTime updateAt,
    // required DateTime deadline,
    required String category,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  // Map<String, dynamic> toFirestore() {
  //   return toJson();
  // }

  factory Task.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data();
    return Task(
      id: snapshot.id,
      body: data?['body'],
      isCompleted: data?['isCompleted'],
      // createAt: formatter.parseStrict(data?['createAt']),
      // updateAt: formatter.parseStrict(data?['updateAt']),
      // deadline: formatter.parseStrict(data?['deadline']),
      category: data?['category'],
    );
  }
}

@freezed
class TaskList with _$TaskList {
  const factory TaskList({
    @Default([]) List<Task> tasks,
    @Default(FilterType.active) FilterType filterType,
    @Default([]) List<Task> allTasks,
  }) = _TaskList;
}

final tasksProvider = StreamProvider<List<Task>>((ref) {
  var repository = ref.watch(taskRepositoryProvider);
  return repository.find();
});

final filterProvider = StateProvider((ref) => FilterType.active);

final filteredTasksProvider = Provider<List<Task>>((ref) {
  final filter = ref.watch(filterProvider);
  final List<Task> tasks = ref.watch(tasksProvider).value ?? [];

  switch (filter) {
    case FilterType.all:
      return tasks;
    case FilterType.isCompleted:
      return tasks.where((task) => task.isCompleted).toList();
    case FilterType.active:
      return tasks.where((task) => !task.isCompleted).toList();
  }
});
