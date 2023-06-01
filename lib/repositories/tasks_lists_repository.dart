import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';

class TasksListsRepository extends GetxController {
  RxMap<String, RxList<TaskModel>> tasksLists =
      RxMap<String, RxList<TaskModel>>({});

  RxList<TaskModel> ideasList = RxList<TaskModel>([]);
  RxList<TaskModel> myDayList = RxList<TaskModel>([]);
  RxList<TaskModel> doLaterList = RxList<TaskModel>([]);

  Future<void> saveDefaultLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Converter as listas para uma representação serializável (JSON)
    List<Map<String, dynamic>> ideasListJson =
        ideasList.map((task) => task.toMap()).toList();
    List<Map<String, dynamic>> myDayListJson =
        myDayList.map((task) => task.toMap()).toList();
    List<Map<String, dynamic>> doLaterListJson =
        doLaterList.map((task) => task.toMap()).toList();

    // Criar um mapa contendo as listas serializadas
    Map<String, dynamic> listsMap = {
      'ideasList': ideasListJson,
      'myDayList': myDayListJson,
      'doLaterList': doLaterListJson,
    };

    // Converter o mapa para uma string JSON
    String json = jsonEncode(listsMap);

    // Salvar a string JSON no SharedPreferences
    await prefs.setString('lists', json);
  }

  Future<void> loadDefaultLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Carregar a string JSON do SharedPreferences
    String? json = prefs.getString('lists');

    if (json != null) {
      // Converter a string JSON de volta para o mapa
      Map<String, dynamic> listsMap = jsonDecode(json);

      // Converter as listas de volta para o tipo original
      List<Map<String, dynamic>> ideasListJson =
          listsMap['ideasList'].cast<Map<String, dynamic>>();
      List<Map<String, dynamic>> myDayListJson =
          listsMap['myDayList'].cast<Map<String, dynamic>>();
      List<Map<String, dynamic>> doLaterListJson =
          listsMap['doLaterList'].cast<Map<String, dynamic>>();

      ideasList = RxList<TaskModel>(
          ideasListJson.map((taskMap) => TaskModel.fromMap(taskMap)).toList());
      myDayList = RxList<TaskModel>(
          myDayListJson.map((taskMap) => TaskModel.fromMap(taskMap)).toList());
      doLaterList = RxList<TaskModel>(doLaterListJson
          .map((taskMap) => TaskModel.fromMap(taskMap))
          .toList());
    }
  }

  void saveTasksLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Converter o Map para uma representação serializável (JSON)
    Map<String, List<Map<String, dynamic>>> serializableMap = {};
    tasksLists.forEach((key, value) {
      serializableMap[key] = value.map((task) => task.toMap()).toList();
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
      Map<String, dynamic> serializableMap = jsonDecode(json);

      // Converter o Map serializável de volta para o Map original
      tasksLists.clear();
      serializableMap.forEach((key, value) {
        List<dynamic> taskMaps = value;
        List<TaskModel> tasks = taskMaps
            .map(
                (taskMap) => TaskModel.fromMap(taskMap as Map<String, dynamic>))
            .toList();
        tasksLists[key] = RxList<TaskModel>(tasks);
      });
    }
  }
}
