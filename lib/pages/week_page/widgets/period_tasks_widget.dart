// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';
import 'new_task_alert_widget.dart';

class PeriodTasksWidget extends StatefulWidget {
  String period;
  List<TaskModel> tasksList;
  PeriodTasksWidget({
    Key? key,
    required this.period,
    required this.tasksList,
  }) : super(key: key);

  @override
  State<PeriodTasksWidget> createState() => _PeriodTasksWidgetState();
}

class _PeriodTasksWidgetState extends State<PeriodTasksWidget> {
  final _controller = Get.find<WeekPageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106 + (40 * widget.tasksList.length).toDouble(),
      decoration: BoxDecoration(
          color: grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 45,
            ),
            child: Text(
              widget.period,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: (40 * widget.tasksList.length).toDouble(),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.tasksList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: 40,
                  child: Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.tasksList[index].completed =
                                    !widget.tasksList[index].completed;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: widget.tasksList[index].completed
                                      ? orange
                                      : white, // Define a cor da borda
                                  width: 2.0, // Define a largura da borda
                                ),
                              ),
                              child: widget.tasksList[index].completed
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
                        widget.tasksList[index].description,
                        style: GoogleFonts.poppins(color: white, fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          (widget.tasksList.length != 0)
              ? const SizedBox(height: 15)
              : const SizedBox(height: 0),
          //Botão para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 26),
            child: GestureDetector(
              onTap: () {
                //Chama o alertDialog para o usuário digitar a nova tarefa
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return NewTaskAlert();
                  },
                );
              },
              //Estilo do botão para nova tarefa
              child: Row(
                children: [
                  Text(
                    '+',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Nova tarefa',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
