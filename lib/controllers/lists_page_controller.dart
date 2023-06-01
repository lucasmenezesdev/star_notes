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
    tasksListsRepository.loadDefaultLists();
  }

  Map<String, RxList<TaskModel>> getTasksLists() {
    return tasksListsRepository.tasksLists;
  }

  RxList<TaskModel> getIdeaList() {
    return tasksListsRepository.ideasList;
  }

  RxList<TaskModel> getMyDayList() {
    return tasksListsRepository.myDayList;
  }

  RxList<TaskModel> getDoLaterList() {
    return tasksListsRepository.doLaterList;
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

  void addNewTask(String listName, String taskDescription) {
    if (listName == 'Ideias') {
      tasksListsRepository.ideasList.add(TaskModel(
          description: RxString(taskDescription), completed: RxBool(false)));
      tasksListsRepository.saveDefaultLists();
    } else if (listName == 'Meu dia') {
      tasksListsRepository.myDayList.add(TaskModel(
          description: RxString(taskDescription), completed: RxBool(false)));
      tasksListsRepository.saveDefaultLists();
    } else if (listName == 'Fazer depois') {
      tasksListsRepository.doLaterList.add(TaskModel(
          description: RxString(taskDescription), completed: RxBool(false)));
      tasksListsRepository.saveDefaultLists();
    } else {
      tasksListsRepository.tasksLists[listName]!.add(TaskModel(
          description: RxString(taskDescription), completed: RxBool(false)));
      tasksListsRepository.saveTasksLists();
    }

    update();
  }

  void updateDescription(TaskModel task, String newDescription) {
    task.description.value = newDescription;
    tasksListsRepository.saveTasksLists();
    tasksListsRepository.saveDefaultLists();
  }

  void updateCompleted(TaskModel task) {
    task.completed.value = !task.completed.value;
    tasksListsRepository.saveTasksLists();
    tasksListsRepository.saveDefaultLists();
  }

  void removeListTask(TaskModel task, String periodOrList) {
    if (periodOrList == 'Ideias') {
      tasksListsRepository.ideasList.remove(task);
      tasksListsRepository.saveDefaultLists();
    } else if (periodOrList == 'Meu dia') {
      tasksListsRepository.myDayList.remove(task);
      tasksListsRepository.saveDefaultLists();
    } else if (periodOrList == 'Fazer depois') {
      tasksListsRepository.doLaterList.remove(task);
      tasksListsRepository.saveDefaultLists();
    } else {
      getTasksLists()[periodOrList]!.remove(task);
      tasksListsRepository.saveTasksLists();
    }
  }
}
