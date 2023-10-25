import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../models/task_model.dart';
import '../pages/week_page/widgets/modal_task_info_widget.dart';
import '../styles.dart';

Widget itemTaskWidget(
    String periodOrList, TaskModel task, BuildContext context, controller) {
  return Obx(
    () => Container(
      padding: const EdgeInsets.only(left: 23),
      height: 40,
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                controller.updateCompleted(task);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: task.completed.value
                        ? orange
                        : white, // Define a cor da borda
                    width: 2.0, // Define a largura da borda
                  ),
                ),
                child: task.completed.value
                    ? Icon(
                        Icons.check,
                        size: 16,
                        color: orange, // Define a cor do ícone de marcação
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  showModalTaskInfo(context, task, periodOrList, controller),
              child: task.completed.value
                  ? SizedBox(
                      width: isMobile
                          ? (MediaQuery.of(context).size.width - 100)
                          : (MediaQuery.of(context).size.width - 350),
                      child: Text(
                        task.description.value,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : SizedBox(
                      width: isMobile
                          ? (MediaQuery.of(context).size.width - 100)
                          : (MediaQuery.of(context).size.width - 350),
                      child: Text(
                        task.description.value,
                        style: GoogleFonts.poppins(color: white, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
            ),
          ),
        ],
      ),
    ),
  );
}
