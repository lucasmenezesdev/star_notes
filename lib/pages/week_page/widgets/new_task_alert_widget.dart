import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles.dart';

class NewTaskAlert extends StatelessWidget {
  const NewTaskAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: lightPurple),
      ),
      backgroundColor: black,
      title: Text('Adicionar Nova Tarefa',
          style: GoogleFonts.poppins(color: orange, fontSize: 16)),
      content: TextField(
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
          hintStyle: TextStyle(
            color: orange, // Cor desejada para o hintText
          ),
          hintText: 'Ex.: Enviar documentos',
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancelar',
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            // Lógica para adicionar a tarefa
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
