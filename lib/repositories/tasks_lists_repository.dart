import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';

class TasksListsRepository extends GetxController {
  late RxMap<String, RxList<TaskModel>> tasksLists =
      RxMap<String, RxList<TaskModel>>({});

  void saveTasksLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Converter o Map para uma representação serializável (JSON)
    Map<String, List<TaskModel>> serializableMap = {};
    tasksLists.forEach((key, value) {
      serializableMap[key] = value.toList();
    });

    // Converter o Map serializável para uma string JSON
    String json = jsonEncode(serializableMap);

    // Salvar a string JSON no SharedPreferences
    await prefs.setString('tasksLists', json);
  }

  void loadTasksLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Carregar a string JSON do SharedPreferences
    String? json = prefs.getString('tasksLists');

    if (json != null) {
      // Converter a string JSON de volta para o Map serializável
      Map<String, List<dynamic>> serializableMap =
          jsonDecode(json).cast<String, List<dynamic>>();

      // Converter o Map serializável de volta para o Map original
      serializableMap.forEach((key, value) {
        tasksLists[key] = RxList<TaskModel>(value.cast<TaskModel>());
      });
    } else {}
  }
}
