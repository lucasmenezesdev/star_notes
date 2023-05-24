import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

void showModalConfig(BuildContext context) {
  final _controller = Get.find<WeekPageController>();

  List<String> images = ['0', '1', '2', '3', '4'];

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
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height:
              MediaQuery.of(context).viewInsets.bottom + 350, // Altura ajustada
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/images/$index.png'),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 5,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
