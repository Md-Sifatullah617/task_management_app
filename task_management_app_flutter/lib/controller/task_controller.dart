import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/style/style.dart';

import '../main.dart';

class TaskController extends GetxController {
  RxList<Task> taskItems = <Task>[].obs;
  RxBool loading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxInt newTaskCount = 0.obs;
  RxInt completeTaskCount = 0.obs;
  RxInt progressTaskCount = 0.obs;
  RxInt cancelTaskCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      loading.value = true;
      final notes = await client.task.getAllTask();
      taskItems.value = notes;
      newTaskCount.value =
          taskItems.where((task) => task.status == TaskStatus.New).length;
      completeTaskCount.value =
          taskItems.where((task) => task.status == TaskStatus.Completed).length;
      progressTaskCount.value =
          taskItems.where((task) => task.status == TaskStatus.Progress).length;
      cancelTaskCount.value =
          taskItems.where((task) => task.status == TaskStatus.Canceled).length;
      printInfo(info: "Loaded tasks: $taskItems");
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
}
