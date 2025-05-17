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
  Future<void> deleteTask(Session session, int id) async {
    // Find the task by its ID
    Task? task = await Task.db.findById(session, id);
    // If the task is found, delete it
    if (task != null) {
      await Task.db.deleteRow(session, task);
    }
  }

  // Fetch tasks from the database
  Future<List<Task>> getAllTask(Session session) async {
    // By ordering by the id column, we always get task notes in the same order
    // and not in the order they were updated.
    return await Task.db.find(
      session,
      orderBy: (t) => t.id,
    );
  }

  // Update tasks in the database based on their id and status
  Future<void> updateTaskStatus(
      Session session, int id, TaskStatus status) async {
    // Find the task by its ID
    Task? task = await Task.db.findById(session, id);

    // If the task is found, update its status
    if (task != null) {
      task.status = status;
      task.updatedAt = DateTime.now();
      await Task.db.updateRow(session, task);
    }
  }
}
