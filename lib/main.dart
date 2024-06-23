import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:icode_test/pages/home.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox("nameBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Find Game',
      theme: ThemeData(fontFamily: 'Ribeye'),
      home: const HomePage(),
    );
  }
}