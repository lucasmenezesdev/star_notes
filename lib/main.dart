import 'package:flutter/material.dart';
import 'package:star_notes/config.dart';
import 'package:star_notes/styles.dart';

import 'layout.dart';

void main() async {
  await initConfigurations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: black,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Layout(),
    );
  }
}
