import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/task.dart';
import '../logger.dart';

class TaskRepository {
  CollectionReference ref = FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> findNotDone() {
    return ref
        .withConverter(
          fromFirestore: Task.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where('hasFinished', isEqualTo: false)
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

  void finish(Task task) {
    ref.doc(task.id).update({'hasFinished': true});
  }
}
