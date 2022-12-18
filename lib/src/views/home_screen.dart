import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/task.dart';
import '../logger.dart';
import '../repositories/task_repository.dart';

enum FilterType {
  all,
  isCompleted,
  active,
}

final filterTypeProvider = StateProvider<FilterType>(
  (ref) => FilterType.all,
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d('_HomeScreenState build');
    TaskList state = ref.watch(tasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('task list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_download),
            tooltip: 'reload',
            onPressed: () {
              ref.read(tasksProvider.notifier).fetch();
            },
          ),
        ],
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
        children: (state.tasks ?? [])
            .map((Task task) {
              return Dismissible(
                key: Key(task.id!),
                onDismissed: (direction) {
                  logger.d('task: ${task.id} is dismissed.');
                  TaskRepository().finish(task);
                },
                child: ListTile(
                  title: Text(task.body ?? ''),
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

class AddTaskModal extends ConsumerWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String body = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('タスクを追加'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(tasksProvider.notifier).addByText(body);
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
