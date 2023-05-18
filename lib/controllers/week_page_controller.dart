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

  RxMap<int, Map<String, List<TaskModel>>> mapWeekTasks =
      RxMap<int, Map<String, List<TaskModel>>>({
    0: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    1: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    2: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    3: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    4: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    5: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
    6: {
      'manha': [],
      'tarde': [],
      'noite': [],
    },
  });

  List<TaskModel> manha = [];
  List<TaskModel> tarde = [];
  List<TaskModel> noite = [];
}
