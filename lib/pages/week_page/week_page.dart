import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/pages/week_page/widgets/period_tasks_widget.dart';

import '../../controllers/week_page_controller.dart';

import '../../styles.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({super.key});

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  final _controller = Get.find<WeekPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        //Setando a imagem de fundo
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: 15,
              right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  _controller.isAuth
                      ? Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: black),
                              height: 45,
                              width: 45,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Lucas Menezes',
                              style: TextStyle(color: white),
                            ),
                          ],
                        )
                      : GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 105,
                            decoration: BoxDecoration(
                                color: black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Conectar-se',
                              style: TextStyle(color: white),
                            ),
                          ),
                        ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), color: black),
                    height: 45,
                    width: 45,
                    child: Image.asset('assets/icons/stars.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Organização semanal',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600, color: white),
              ),
              const SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_controller.daysList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.selectedDay.value = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 52,
                          decoration: BoxDecoration(
                            color: _controller.selectedDay.value == index
                                ? orange
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: _controller.selectedDay.value == index
                                    ? orange
                                    : lightPurple),
                          ),
                          child: Text(
                            _controller.daysList[index],
                            style: TextStyle(
                              color: _controller.selectedDay.value == index
                                  ? Colors.white
                                  : lightPurple,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    PeriodTasksWidget(
                      period: 'Manhã',
                      tasksList: _controller.mapWeekTasks
                          .value[_controller.selectedDay.value]!['manha']!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PeriodTasksWidget(
                      period: 'Tarde',
                      tasksList: _controller.mapWeekTasks
                          .value[_controller.selectedDay.value]!['tarde']!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PeriodTasksWidget(
                      period: 'Noite',
                      tasksList: _controller.mapWeekTasks
                          .value[_controller.selectedDay.value]!['noite']!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
