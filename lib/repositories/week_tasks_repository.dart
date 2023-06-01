import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';

class WeekTasksRepository extends GetxController {
  void resetWeek() {
    mapWeekTasks[0]?['Manhã']?.clear();
    mapWeekTasks[0]?['Tarde']?.clear();
    mapWeekTasks[0]?['Noite']?.clear();

    mapWeekTasks[1]?['Manhã']?.clear();
    mapWeekTasks[1]?['Tarde']?.clear();
    mapWeekTasks[1]?['Noite']?.clear();

    mapWeekTasks[2]?['Manhã']?.clear();
    mapWeekTasks[2]?['Tarde']?.clear();
    mapWeekTasks[2]?['Noite']?.clear();

    mapWeekTasks[3]?['Manhã']?.clear();
    mapWeekTasks[3]?['Tarde']?.clear();
    mapWeekTasks[3]?['Noite']?.clear();

    mapWeekTasks[4]?['Manhã']?.clear();
    mapWeekTasks[4]?['Tarde']?.clear();
    mapWeekTasks[4]?['Noite']?.clear();

    mapWeekTasks[5]?['Manhã']?.clear();
    mapWeekTasks[5]?['Tarde']?.clear();
    mapWeekTasks[5]?['Noite']?.clear();

    mapWeekTasks[6]?['Manhã']?.clear();
    mapWeekTasks[6]?['Tarde']?.clear();
    mapWeekTasks[6]?['Noite']?.clear();

    saveTaskLists();

    update();
  }

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
