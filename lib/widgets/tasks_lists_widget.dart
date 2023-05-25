import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/lists_page_controller.dart';
import 'list_button_widget.dart';

Widget tasksListsWidget() {
  final _controller = Get.find<ListsPageController>();
  final ScrollController _scrollController = ScrollController();

  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Obx(
            () => Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                itemCount: _controller.getTasksLists().length,
                itemBuilder: (context, index) {
                  List<String> listKeys =
                      _controller.getTasksLists().keys.toList();

                  dynamic currentTask =
                      _controller.getTasksLists()[listKeys[index]];

                  return listButton(null, listKeys[index], () {});
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
