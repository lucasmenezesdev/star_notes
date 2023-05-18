// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';
import 'modal_task_info.dart';

class ItemPeriodTaskWidget extends StatelessWidget {
  String period;
  TaskModel task;
  ItemPeriodTaskWidget({
    Key? key,
    required this.period,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => showModalTaskInfo(context, task, period),
        child: Container(
          padding: const EdgeInsets.only(left: 23),
          height: 40,
          child: Row(
            children: [
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        task.completed.value = !task.completed.value;
                      });
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
                              color:
                                  orange, // Define a cor do ícone de marcação
                            )
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                task.description.value,
                style: GoogleFonts.poppins(color: white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
