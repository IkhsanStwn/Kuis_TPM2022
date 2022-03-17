import 'package:flutter/material.dart';
import 'package:kuistpm2022/list_screen.dart';
import 'package:kuistpm2022/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis TPM 2022',
      theme: ThemeData(),
      home: ListScreen(),
    );
  }
}
