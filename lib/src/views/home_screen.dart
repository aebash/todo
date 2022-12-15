import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/task.dart';
import '../logger.dart';
import '../repositories/task_repository.dart';

final tasksProvider = StreamProvider.autoDispose<List<Task>>((ref) {
  return TaskRepository().findNotDone();
});

enum FilterType {
  all,
  isCompleted,
  active,
}

final filterTypeProvider = StateProvider<FilterType>(
  (ref) => FilterType.all,
);

final displayTasksProvider = Provider.autoDispose<List<Task>>((ref) {
  final filterType = ref.watch(filterTypeProvider);
  final AsyncValue<List<Task>> tasks = ref.watch(tasksProvider);
  switch (filterType) {
    case FilterType.all:
      return tasks.when(
        loading: () => [],
        error: (err, stack) => [],
        data: (data) {
          return data;
        },
      );
    case FilterType.isCompleted:
      return tasks.when(
        loading: () => [],
        error: (err, stack) => [],
        data: (data) {
          return data.where((task) => task.isCompleted).toList();
        },
      );
    case FilterType.active:
      return tasks.when(
        loading: () => [],
        error: (err, stack) => [],
        data: (data) {
          return data.where((task) => !task.isCompleted).toList();
        },
      );
  }
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    logger.d('_HomeScreenState build');
    final displayTasks = ref.watch(displayTasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('task list'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.restorablePush<void>(
            context,
            _fullscreenDialogRoute,
          );
        },
        label: const Icon(Icons.add),
      ),
      body: ListView(
        children: displayTasks
            .map((Task task) {
              return Dismissible(
                key: Key(task.id!),
                onDismissed: (direction) {
                  logger.d('task: ${task.id} is dismissed.');
                  TaskRepository().finish(task);
                },
                child: ListTile(
                  title: Text(task.body),
                  subtitle: Text(task.id!),
                ),
              );
            })
            .toList()
            .cast(),
      ),
    );
  }

  static Route<void> _fullscreenDialogRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return MaterialPageRoute<void>(
      builder: (context) => const AddTaskModal(),
      fullscreenDialog: true,
    );
  }
}

class AddTaskModal extends StatelessWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    String body = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('タスクを追加'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              // todo TaskRepository インスタンスの管理
              TaskRepository().add(Task(body: body));
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: TextFormField(
        autofocus: true,
        maxLines: 3,
        onChanged: (value) {
          body = value;
        },
      ),
    );
  }
}
