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

// final streamProvider = StreamProvider<List<Task>>((ref) {
//   return TaskRepository().findNotDone();
// });

class TasksNotifier extends StateNotifier<TaskList> {
  TasksNotifier() : super(const TaskList());
  final TaskRepository repository = TaskRepository();

  Future<void> fetch() async {
    state = state.copyWith(tasks: await repository.find());
  }

  void add(Task task) {
    repository.add(task);
  }

  void addByText(String text) {
    repository.add(Task(
        body: text,
        isCompleted: false,
        // createAt: DateTime.now(),
        // updateAt: DateTime.now(),
        // deadline: DateTime.now().add(const Duration(days: 7)),
        category: 'category'));
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, TaskList>((ref) {
  return TasksNotifier()..fetch();
});

final filterProvider = StateProvider((ref) => FilterType.active);

final filteredTasksProvider = Provider<List<Task>>((ref) {
  final filter = ref.watch(filterProvider);
  final tasks = ref.watch(tasksProvider);

  switch (filter) {
    case FilterType.all:
      return tasks.tasks;
    case FilterType.isCompleted:
      return tasks.tasks.where((task) => task.isCompleted).toList();
    case FilterType.active:
      return tasks.tasks.where((task) => !task.isCompleted).toList();
  }
});
