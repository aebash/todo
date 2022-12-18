import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/task.dart';
import '../logger.dart';

class TaskRepository {
  CollectionReference ref = FirebaseFirestore.instance.collection('tasks');

  Future<List<Task>> find() async {
    var snapshot = await ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toJson(),
        )
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Stream<List<Task>> findNotDone() {
    return ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toJson(),
        )
        .where('isCompleted', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot<Task> event) =>
            event.docs.map((e) => e.data()).toList());
  }

  void add(Task task) {
    logger.d('add. task: $task');
    ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toJson(),
        )
        .add(task);
  }

  void finish(Task task) {
    ref.doc(task.id).update({'isCompleted': true});
  }
}
