import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/week_page_controller.dart';
import '../../../repositories/week_tasks_repository.dart';
import '../../../styles.dart';
import '../../../widgets/alert_widget.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height:
              MediaQuery.of(context).viewInsets.bottom + 350, // Altura ajustada
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
                height: 30,
              ),
              Text(
                'Imagem de fundo',
                style: GoogleFonts.poppins(fontSize: 16, color: white),
              ),
              SizedBox(
                height: 10,
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
                        () => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              _controller.currentImage.value = index;
                              _controller.saveImage();
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: 200,
                                        width: 100,
                                        //Setando a imagem de fundo
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/$index.png'),
                                                fit: BoxFit.cover)),
                                      ),
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
                              ],
                            ),
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
              const SizedBox(
                height: 20,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alertWidget('Tem certeza que deseja excluir?',
                            'Após confirmar todas as tarefas existentes nos dias da semana serão excluídas.',
                            () {
                          final _controller = Get.find<WeekTasksRepository>();
                          _controller.resetWeek();

                          Navigator.of(context).pop();
                        });
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete_outline, color: Colors.redAccent),
                      Text(
                        'Limpar tarefas da semana',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.redAccent),
                      ),
                    ],
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
