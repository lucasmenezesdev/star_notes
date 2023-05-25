import 'package:get/get.dart';
import 'package:star_notes/models/task_model.dart';
import 'package:star_notes/repositories/tasks_lists_repository.dart';

class ListsPageController extends GetxController {
  final tasksListsRepository = Get.find<TasksListsRepository>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tasksListsRepository.loadTasksLists();
  }

  Map<String, RxList<TaskModel>> getTasksLists() {
    return tasksListsRepository.tasksLists;
  }

  void removeList(String title) {
    tasksListsRepository.tasksLists.remove(title);

    tasksListsRepository.saveTasksLists();
  }

  void addNewList(String title) {
    tasksListsRepository.tasksLists[title] = RxList<TaskModel>([]);

    tasksListsRepository.saveTasksLists();
    update();
  }
}
