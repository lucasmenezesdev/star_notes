// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';

import '../../../styles.dart';

// ignore: must_be_immutable
class NewTaskAlert extends StatefulWidget {
  String period;

  NewTaskAlert({
    Key? key,
    required this.period,
  }) : super(key: key);

  @override
  State<NewTaskAlert> createState() => _NewTaskAlertState();
}

class _NewTaskAlertState extends State<NewTaskAlert> {
  final _controller = Get.find<WeekPageController>();
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: lightPurple),
      ),
      backgroundColor: black,
      title: Center(
        child: Text(
          'Adicionar Nova Tarefa',
          style: GoogleFonts.poppins(
              color: white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      content: TextField(
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
          labelStyle: GoogleFonts.poppins(color: white, fontSize: 14),
          hintStyle: GoogleFonts.poppins(color: white, fontSize: 14),
          hintText: 'Ex.: Enviar documentos',
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(30), // Define o raio do border
            ),
            backgroundColor: orange,
          ),
          child: Text('Adicionar',
              style: GoogleFonts.poppins(color: white, fontSize: 16)),
          onPressed: () {
            if (textController.text.isNotEmpty) {
              setState(() {
                _controller.addNewTask(textController.text, widget.period);
              });
            }
            // Lógica para adicionar a tarefa
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
