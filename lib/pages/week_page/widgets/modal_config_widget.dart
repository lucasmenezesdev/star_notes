import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';

import '../../../models/task_model.dart';
import '../../../styles.dart';

void showModalConfig(BuildContext context) {
  final _controller = Get.find<WeekPageController>();
  final ScrollController _scrollController = ScrollController();

  List<String> images = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

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
                child: Scrollbar(
                  controller: _scrollController,
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            _controller.currentImage.value = index;
                            _controller.saveImage();
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/$index.png'),
                              ),
                              (_controller.currentImage.value == index)
                                  ? Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 5,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
