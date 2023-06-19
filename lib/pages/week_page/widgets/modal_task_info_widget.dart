import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

void showModalTaskInfo(
    BuildContext context, TaskModel task, String periodOrList, controller) {
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
    isScrollControlled: true, // Adicionado isScrollControlled
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        // Adicionado SingleChildScrollView
        child: SizedBox(
          height:
              MediaQuery.of(context).viewInsets.bottom + 300, // Altura ajustada
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
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  maxLines: 5,
                  controller: textController,
                  style: GoogleFonts.poppins(color: white),
                  cursorColor: white,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.poppins(color: white, fontSize: 14),
                    hintStyle: GoogleFonts.poppins(color: white, fontSize: 14),
                    hintText: 'Ex.: Enviar documentos',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        try {
                          controller.removeListTask(task, periodOrList);
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                        ),
                        child: Icon(
                          Icons.delete,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (textController.text != task.description) {
                          controller.updateDescription(
                              task, textController.text);
                        }
                      },
                      child: Text(
                        'Confirmar alterações',
                        style: GoogleFonts.poppins(color: white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}
