import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';

class WeekTasksRepository extends GetxController {
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

  Future<void> saveTaskLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (int day in mapWeekTasks.keys) {
      String dayKey = 'day_$day';

      for (String period in mapWeekTasks[day]!.keys) {
        String periodKey = '$dayKey-$period';
        List<TaskModel> tasks = mapWeekTasks[day]![period]!.value;

        List<Map<String, dynamic>> taskData =
            tasks.map((task) => task.toMap()).toList();

        await prefs.setString(periodKey, jsonEncode(taskData));
      }
    }
  }

  Future<void> loadTaskLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (int day in mapWeekTasks.keys) {
      String dayKey = 'day_$day';

      for (String period in mapWeekTasks[day]!.keys) {
        String periodKey = '$dayKey-$period';

        String? taskDataJson = prefs.getString(periodKey);

        if (taskDataJson != null) {
          List<Map<String, dynamic>> taskData =
              jsonDecode(taskDataJson).cast<Map<String, dynamic>>();

          List<TaskModel> tasks =
              taskData.map((data) => TaskModel.fromMap(data)).toList();

          mapWeekTasks[day]![period]!.clear();
          mapWeekTasks[day]![period]!.addAll(tasks);
        }
      }
    }
  }
}
