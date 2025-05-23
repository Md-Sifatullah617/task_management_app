import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class TaskEndpoint extends Endpoint {
  // Endpoint implementation goes here
  Future<int?> _getUserId(Session session) async {
    return (await session.authenticated)?.userId;
  }

  // Store tasks in the database
  Future<void> creatTask(
      Session session, String title, String description) async {
    final userId = await _getUserId(session);
    // Create a new task object
    Task note = Task(
      title: title,
      description: description,
      status: TaskStatus.New,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: userId!,
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
    int? userId = await _getUserId(session);
    // By ordering by the id column, we always get task notes in the same order
    // and not in the order they were updated.
    return await Task.db.find(
      session,
      orderBy: (t) => t.id,
      where: (t) => t.userId.equals(userId),
    );
  }

  // Update tasks in the database based on their id and status
  Future<void> updateTaskStatus(
      Session session, int id, TaskStatus status) async {
    int? userId = await _getUserId(session);
    // Find the task by its ID
    Task? task = await Task.db.findFirstRow(session,
        where: (t) => t.id.equals(id) & t.userId.equals(userId));

    // If the task is found, update its status
    if (task != null) {
      task.status = status;
      task.updatedAt = DateTime.now();
      await Task.db.updateRow(session, task);
    }
  }

  // Update tasks in the database based on their id
  Future<void> updateTask(
      Session session, int id, String title, String description) async {
    // Find the task by its ID
    Task? task = await Task.db.findById(session, id);

    // If the task is found, update its title and description
    if (task != null) {
      task.title = title;
      task.description = description;
      task.updatedAt = DateTime.now();
      await Task.db.updateRow(session, task);
    }
  }
}
