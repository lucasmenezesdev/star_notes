import 'package:get/get.dart';
import 'package:star_notes/repositories/week_tasks_repository.dart';

import 'controllers/week_page_controller.dart';

initConfigurations() async {
  Get.lazyPut(() => WeekPageController());
  Get.lazyPut(() => WeekTasksRepository());
}
