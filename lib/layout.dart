import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_notes/pages/lists_page/lists_page.dart';
import 'package:star_notes/pages/lists_page/widgets/new_list_alert_widget.dart';
import 'package:star_notes/pages/week_page/week_page.dart';
import 'package:star_notes/styles.dart';
import 'package:star_notes/widgets/list_button_widget.dart';
import 'package:star_notes/widgets/tasks_lists_widget.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final PageController _pageController = PageController();

  int itemIndex = 0;

  void setItemIndex(int index) {
    setState(() {
      itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return isMobile
            ? Scaffold(
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.black45, blurRadius: 10)
                    ],
                  ),
                  child: BottomNavigationBar(
                      backgroundColor: black,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: itemIndex,
                      onTap: (int page) {
                        setItemIndex(page);
                        _pageController.animateToPage(page,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: SizedBox(
                                height: 30,
                                child: Image.asset('assets/icons/week.png')),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: SizedBox(
                                height: 30,
                                child: Image.asset('assets/icons/lists.png')),
                            label: ''),
                      ]),
                ),
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const [WeekPage(), ListsPage()],
                ),
              )
            : Scaffold(
                body: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      color: black,
                      height: MediaQuery.of(context).size.height,
                      width: 250,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Star',
                                style: GoogleFonts.poppins(
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                'Notes',
                                style: GoogleFonts.poppins(
                                    color: lightPurple,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(30),
                          //           color: Colors.black),
                          //       height: 40,
                          //       width: 40,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       'Usuário',
                          //       style: GoogleFonts.poppins(
                          //           color: white,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.normal),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          listButton('assets/icons/week.png',
                              'Organização semanal', () {}),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0.3,
                            width: 250,
                            color: white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          listButton('assets/icons/ideia.png', 'Ideias', () {}),
                          SizedBox(
                            height: 10,
                          ),
                          listButton('assets/icons/sol.png', 'Meu dia', () {}),
                          SizedBox(
                            height: 10,
                          ),
                          listButton('assets/icons/despertador.png',
                              'Fazer depois', () {}),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0.3,
                            width: 250,
                            color: white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                tasksListsWidget(),

                                //Botão para adicionar nova lista
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 40),
                                      width: 230,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        children: [
                                          Text(
                                            '+',
                                            style: GoogleFonts.poppins(
                                              fontSize: 25,
                                              color: black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: WeekPage())
                  ],
                ),
              );
      },
    );
  }
}
