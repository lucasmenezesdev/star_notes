import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';
import 'package:star_notes/repositories/week_tasks_repository.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

Widget alertWidget(String title, String subTitle, Function() onConfirm) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: lightPurple),
    ),
    backgroundColor: black,
    title: Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
            color: white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    content: Text(
      subTitle,
      style: GoogleFonts.poppins(
        color: white,
        fontSize: 12,
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancelar')),
      Expanded(child: SizedBox()),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Define o raio do border
          ),
          backgroundColor: orange,
        ),
        child: Text('Confirmar',
            style: GoogleFonts.poppins(color: white, fontSize: 16)),
        onPressed: onConfirm,
      ),
    ],
  );
}
