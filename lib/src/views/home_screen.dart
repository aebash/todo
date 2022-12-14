import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/service/authentication_service.dart';

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
    List<Task> tasks = ref.watch(filteredTasksProvider);

    AppLocalizations localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.taskList),
        actions: const [
          FilterDropDown(),
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
        children: (tasks)
            .map((Task task) {
              return Dismissible(
                key: Key(task.id!),
                onDismissed: (direction) {
                  logger.d('task: ${task.id} is dismissed.');
                  ref.read(taskRepositoryProvider).finish(task);
                },
                child: ListTile(
                  title: Text(task.body ?? ''),
                ),
              );
            })
            .toList()
            .cast(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(localization.signOut),
              trailing: const Icon(Icons.outbound),
              onTap: () {
                AuthenticationService.signOut();
              },
            ),
          ],
        ),
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

class FilterDropDown extends ConsumerWidget {
  const FilterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<FilterType>(
      value: ref.watch(filterProvider),
      onChanged: (FilterType? value) {
        ref.read(filterProvider.notifier).state = value!;
      },
      items: FilterType.values
          .map<DropdownMenuItem<FilterType>>((FilterType value) {
        return DropdownMenuItem<FilterType>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      icon: const Icon(size: 0, Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      dropdownColor: Colors.grey,
    );
  }
}

class AddTaskModal extends ConsumerWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    String body = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.addTask),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(taskRepositoryProvider).addByText(body);
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
