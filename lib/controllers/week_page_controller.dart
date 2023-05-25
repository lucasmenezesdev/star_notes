import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_notes/repositories/week_tasks_repository.dart';

import '../models/task_model.dart';

class WeekPageController extends GetxController {
  final weekTasksRepository = Get.find<WeekTasksRepository>();
  final ScrollController scrollController = ScrollController();

  bool isAuth = false;
  RxInt selectedDay = 0.obs;

  RxInt currentImage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedDay.value = currentDay();
    weekTasksRepository.loadTaskLists();
    loadImage();
  }

  int currentDay() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;
    late int day;
    switch (currentWeekday) {
      case 7:
        day = 0;
        break;
      case 1:
        day = 1;
        break;
      case 2:
        day = 2;
        break;
      case 3:
        day = 3;
        break;
      case 4:
        day = 4;
        break;
      case 5:
        day = 5;
        break;
      case 6:
        day = 6;
        break;
    }
    return day;
  }

  List<String> daysList = ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB'];

  List<TaskModel> getTaskList(String period) {
    return weekTasksRepository.mapWeekTasks[selectedDay.value]![period]!;
  }

  void removeListTask(TaskModel task, String period) {
    weekTasksRepository.mapWeekTasks[selectedDay.value]![period]!.remove(task);
    weekTasksRepository.saveTaskLists();
  }

  void addNewTask(String task, String period) {
    RxString newDescription = task.obs;
    RxBool newBool = false.obs;

    weekTasksRepository.mapWeekTasks[selectedDay.value]![period]!.add(TaskModel(
      description: newDescription,
      completed: newBool,
    ));
    weekTasksRepository.saveTaskLists();
    update();
  }

  void updateDescription(TaskModel task, String newDescription) {
    task.description.value = newDescription;
    weekTasksRepository.saveTaskLists();
  }

  void updateCompleted(TaskModel task) {
    task.completed.value = !task.completed.value;
    weekTasksRepository.saveTaskLists();
  }

  void saveImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imageWeek', currentImage.value.toString());
  }

  void loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? image = prefs.getString('imageWeek');
    if (image != null) {
      currentImage.value = int.parse(image);
    }
  }
}
