import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/controllers/lists_page_controller.dart';
import 'package:star_notes/pages/lists_page/widgets/new_list_alert_widget.dart';
import '../../styles.dart';
import '../../widgets/list_button_widget.dart';
import '../../widgets/tasks_lists_widget.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ListsPageController>();

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewListAlertWidget();
            },
          );
        },
        //Estilo do botão para nova lista
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Nova lista',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 30,
          ),
          listButton('assets/icons/ideia.png', 'Ideias', () {}),
          SizedBox(
            height: 10,
          ),
          listButton('assets/icons/sol.png', 'Meu dia', () {}),
          SizedBox(
            height: 10,
          ),
          listButton('assets/icons/despertador.png', 'Fazer depois', () {}),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 0.3,
            color: white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Listas de tarefas',
            style: GoogleFonts.poppins(color: white, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          tasksListsWidget(),
        ]),
      ),
    );
  }
}
