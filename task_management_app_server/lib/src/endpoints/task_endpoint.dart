import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class TaskEndpoint extends Endpoint {
  // Endpoint implementation goes here

  // Store tasks in the database
  Future<void> creatTask(
      Session session, String title, String description) async {
    // Create a new task object
    Task note = Task(
      title: title,
      description: description,
      status: TaskStatus.New,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Insert the task into the database
    await Task.db.insert(session, [note]);
  }

  // Delete tasks from the database
  Future<void> deleteTask(Session session, Task note) async {
    await Task.db.deleteRow(session, note);
  }

  // Fetch tasks from the database
  Future<List<Task>> getAllTask(Session session) async {
    // By ordering by the id column, we always get the notes in the same order
    // and not in the order they were updated.
    return await Task.db.find(
      session,
      orderBy: (t) => t.id,
    );
  }
}
