// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/lists_page_controller.dart';
import 'package:star_notes/controllers/week_page_controller.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

class NewListAlertWidget extends StatefulWidget {
  NewListAlertWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewListAlertWidget> createState() => _NewListAlertWidgetState();
}

class _NewListAlertWidgetState extends State<NewListAlertWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final _controller = Get.find<ListsPageController>();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: lightPurple),
      ),
      backgroundColor: black,
      title: Center(
        child: Text(
          'Criar nova lista',
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
          hintText: 'Ex.: Compras',
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
                _controller.addNewList(textController.text);
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
