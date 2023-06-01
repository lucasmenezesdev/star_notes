import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_notes/config.dart';
import 'package:star_notes/styles.dart';

import 'layout.dart';

late bool isMobile;
void main() async {
  await initConfigurations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        isMobile = constraints.maxWidth < 600;

        return isMobile
            ? GetMaterialApp(
                debugShowCheckedModeBanner: false,
                color: black,
                title: 'Star Notes',
                theme: ThemeData(
                  primarySwatch: Colors.grey,
                ),
                home: const Layout(),
              )
            : fluent.FluentApp(
                debugShowCheckedModeBanner: false,
                color: black,
                title: 'Star Notes',
                home: const Layout(),
              );
      },
    );
  }
}
