import 'package:get/get.dart';

import 'controllers/week_page_controller.dart';

initConfigurations() async {
  Get.lazyPut(() => WeekPageController());
}
