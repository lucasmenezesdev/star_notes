import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

void showModalTaskInfo(BuildContext context, TaskModel task) {
  TextEditingController textController = TextEditingController();
  textController.text = task.description.value;
  showModalBottomSheet(
    backgroundColor: black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 60,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
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
                  labelStyle: GoogleFonts.poppins(color: white, fontSize: 14),
                  hintStyle: GoogleFonts.poppins(color: white, fontSize: 14),
                  hintText: 'Ex.: Enviar documentos',
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (textController.text != task.description) {
                  task.description.value = textController.text;
                  print('Foiii');
                } else
                  print('Não foiiiii');
              },
              child: Text(
                'Confirmar alterações',
                style: GoogleFonts.poppins(color: white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    },
  );
}
