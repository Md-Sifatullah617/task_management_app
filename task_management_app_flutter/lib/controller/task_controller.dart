import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/style/style.dart';

import '../main.dart';

class TaskController extends GetxController {
  RxList<Task> newTaskItems = <Task>[].obs;
  RxList<Task> progressTaskItems = <Task>[].obs;
  RxList<Task> completeTaskItems = <Task>[].obs;
  RxList<Task> cancelTaskItems = <Task>[].obs;
  RxBool loading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<TaskStatus> status = TaskStatus.New.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      loading.value = true;
      final taskList = await client.task.getAllTask();
      newTaskItems.value =
          taskList.where((task) => task.status == TaskStatus.New).toList();
      progressTaskItems.value =
          taskList.where((task) => task.status == TaskStatus.Progress).toList();
      completeTaskItems.value = taskList
          .where((task) => task.status == TaskStatus.Completed)
          .toList();
      cancelTaskItems.value =
          taskList.where((task) => task.status == TaskStatus.Canceled).toList();
      debugPrint("Tasks loaded successfully with ${taskList.length} items.");
    } catch (e) {
      // Handle error
      debugPrint("Error loading tasks: $e");
    } finally {
      loading.value = false;
    }
  }

  Future<void> createTask() async {
    try {
      loading.value = true;
      await client.task.creatTask(
        titleController.text,
        descriptionController.text,
      );
      customToast("Task Added Successfully!");
      loadTasks();
    } catch (e) {
      // Handle error
      debugPrint("Error creating task: $e");
    } finally {
      Get.back();
      loading.value = false;
      titleController.clear();
      descriptionController.clear();
    }
  }

  Future<void> updateStatusById(int id) async {
    try {
      loading.value = true;
      await client.task.updateTaskStatus(id, status.value);
      customToast("Task Status Updated Successfully!");
      loadTasks();
    } catch (e) {
      // Handle error
      debugPrint("Error updating task status: $e");
    } finally {
      Get.back();
      loading.value = false;
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      loading.value = true;
      await client.task.deleteTask(id);
      customToast("Task Deleted Successfully!");
      
    } catch (e) {
      // Handle error
      debugPrint("Error deleting task: $e");
    } finally {
      Get.back();
      loading.value = false;
    }
  }
}
