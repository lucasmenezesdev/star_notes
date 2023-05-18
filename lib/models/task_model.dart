// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class TaskModel extends GetxController {
  RxString description = ''.obs;
  RxBool completed = false.obs;

  TaskModel({
    required this.description,
  });
}
