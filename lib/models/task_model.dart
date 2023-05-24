// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class TaskModel extends GetxController {
  RxString description = ''.obs;
  RxBool completed = false.obs;

  TaskModel({
    required this.description,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return {'description': description.value, 'completed': completed.value};
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      description: RxString(map['description']),
      completed: RxBool(map['completed']),
    );
  }
}
