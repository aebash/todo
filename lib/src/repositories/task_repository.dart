import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/task.dart';
import '../logger.dart';

class TaskRepository {
  CollectionReference ref = FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> find() {
    return ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toJson(),
        )
        .orderBy('createAt', descending: true)
        .snapshots()
        .map((QuerySnapshot<Task> event) =>
            event.docs.map((e) => e.data()).toList());
  }

  void add(Task task) {
    logger.d('add. task: $task');
    ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .add(task);
  }

  void addByText(String text) {
    add(Task(
        body: text,
        isCompleted: false,
        createAt: DateTime.now(),
        // updateAt: DateTime.now(),
        // deadline: DateTime.now().add(const Duration(days: 7)),
        category: 'category'));
  }

  void finish(Task task) {
    ref.doc(task.id).update({'isCompleted': true});
  }
}

final taskRepositoryProvider =
    Provider<TaskRepository>((ref) => TaskRepository());
