import 'package:flutter/material.dart';
import 'package:star_notes/pages/lists_page.dart';
import 'package:star_notes/pages/week_page/week_page.dart';
import 'package:star_notes/styles.dart';

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
    return Scaffold(
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
                      height: 30, child: Image.asset('assets/icons/week.png')),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 30, child: Image.asset('assets/icons/lists.png')),
                  label: ''),
            ]),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [WeekPage(), ListsPage()],
      ),
    );
  }
}
