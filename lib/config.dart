import 'package:get/get.dart';
import 'package:star_notes/repositories/tasks_lists_repository.dart';
import 'package:star_notes/repositories/week_tasks_repository.dart';

import 'controllers/lists_page_controller.dart';
import 'controllers/week_page_controller.dart';

initConfigurations() async {
  Get.lazyPut(() => WeekPageController());
  Get.lazyPut(() => WeekTasksRepository());
  Get.lazyPut(() => TasksListsRepository());
  Get.lazyPut(() => ListsPageController());
}
