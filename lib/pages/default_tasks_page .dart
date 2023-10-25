// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:star_notes/controllers/lists_page_controller.dart';
import 'package:star_notes/widgets/item_task_widget.dart';

import '../models/task_model.dart';
import '../styles.dart';

// ignore: must_be_immutable
class DefaultTasksPage extends StatefulWidget {
  String listName;
  RxList<TaskModel> list;
  DefaultTasksPage({
    Key? key,
    required this.listName,
    required this.list,
  }) : super(key: key);

  @override
  State<DefaultTasksPage> createState() => _DefaultTasksPageState();
}

class _DefaultTasksPageState extends State<DefaultTasksPage> {
  final _controller = Get.find<ListsPageController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text(
          '${widget.listName}',
          style: GoogleFonts.poppins(fontSize: 18, color: white),
        ),
        leading: BackButton(
          color: white,
        ),
      ),
      backgroundColor: black,
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 0.3,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      return itemTaskWidget(widget.listName, widget.list[index],
                          context, _controller);
                    }),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0,
                        3), // Define a posição da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      style: GoogleFonts.poppins(color: white),
                      cursorColor: white,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: lightPurple,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: white, // Cor desejada para a linha de baixo
                          ),
                        ),
                        labelStyle:
                            GoogleFonts.poppins(color: white, fontSize: 14),
                        hintStyle:
                            GoogleFonts.poppins(color: white, fontSize: 14),
                        hintText: '        Ex.: Enviar documentos',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (textController.text != '') {
                          _controller.addNewTask(
                              widget.listName, textController.text);

                          textController.clear();
                        } else
                          Get.snackbar('Campo vazio!',
                              'Adicione uma tarefa antes de confirmar.',
                              colorText: white);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.send,
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
