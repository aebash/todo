import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String body;
  bool hasFinished;

  Task({
    this.id,
    required this.body,
    this.hasFinished = false,
  });

  @override
  String toString() {
    return 'Task{id: $id, body: $body, hasFinished: $hasFinished}';
  }

  Map<String, dynamic> toFirestore() {
    return {
      'body': body,
      'hasFinished': hasFinished,
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
      hasFinished: data?['hasFinished'],
    );
  }
}
