// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';
import 'package:star_notes/pages/week_page/widgets/item_period_task_widget.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';
import 'new_task_alert_widget.dart';

class PeriodTasksWidget extends StatefulWidget {
  String period;
  PeriodTasksWidget({
    Key? key,
    required this.period,
  }) : super(key: key);

  @override
  State<PeriodTasksWidget> createState() => _PeriodTasksWidgetState();
}

class _PeriodTasksWidgetState extends State<PeriodTasksWidget> {
  final _controller = Get.find<WeekPageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 111 +
            (40 * _controller.getTaskList(widget.period).length).toDouble(),
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
            const SizedBox(height: 15),
            SizedBox(
              height: (40 * _controller.getTaskList(widget.period).length)
                  .toDouble(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.getTaskList(widget.period).length,
                itemBuilder: (context, index) {
                  return ItemPeriodTaskWidget(
                    task: _controller.getTaskList(widget.period)[index],
                  );
                },
              ),
            ),
            (_controller.getTaskList(widget.period).length != 0)
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
                      return NewTaskAlert(
                        period: widget.period,
                      );
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
      ),
    );
  }
}
