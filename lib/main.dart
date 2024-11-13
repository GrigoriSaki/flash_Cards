// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homePage.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(iconTheme: IconThemeData(size: 38)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
