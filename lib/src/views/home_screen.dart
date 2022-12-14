import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/view_models/task_provider.dart';

import '../data/task.dart';
import '../logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    logger.d('_HomeScreenState build');
    var viewModel = Provider.of<TaskViewModel>(context);
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
      body: StreamBuilder<List<Task>>(
        stream: viewModel.tasks,
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!
                .map((Task task) {
                  return Dismissible(
                    key: Key(task.id!),
                    onDismissed: (direction) {
                      logger.d('task: ${task.id} is dismissed.');
                      viewModel.finish(task);
                    },
                    child: ListTile(
                      title: Text(task.body),
                      subtitle: Text(task.id!),
                    ),
                  );
                })
                .toList()
                .cast(),
          );
        },
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
    TaskViewModel viewModel = Provider.of<TaskViewModel>(context);

    String body = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('タスクを追加'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              viewModel.add(Task(body: body));
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
