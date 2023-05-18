import 'package:get/get.dart';

import '../models/task_model.dart';

class WeekPageController extends GetxController {
  bool isAuth = false;
  RxInt selectedDay = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedDay.value = currentDay();
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

  Map<int, Map<String, RxList<TaskModel>>> mapWeekTasks = {
    0: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    1: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    2: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    3: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    4: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    5: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
    6: {
      'Manhã': RxList<TaskModel>([]),
      'Tarde': RxList<TaskModel>([]),
      'Noite': RxList<TaskModel>([]),
    },
  };

  List<TaskModel> getTaskList(String period) {
    return mapWeekTasks[selectedDay.value]![period]!;
  }

  void addNewTask(String task, String period) {
    RxString newTask = ''.obs;
    newTask.value = task;
    mapWeekTasks[selectedDay.value]![period]!.add(TaskModel(
      description: newTask,
    ));
    update();
  }
}
