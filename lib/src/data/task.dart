import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String body;
  bool isCompleted;

  Task({
    this.id,
    required this.body,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return 'Task{id: $id, body: $body, hasFinished: $isCompleted}';
  }

  Map<String, dynamic> toFirestore() {
    return {
      'body': body,
      'hasFinished': isCompleted,
    };
  }

  factory Task.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data();
    return Task(
      id: snapshot.id,
      body: data?['body'],
      isCompleted: data?['hasFinished'],
    );
  }
}
