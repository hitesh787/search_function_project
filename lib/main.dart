import 'package:flutter/material.dart';
import 'package:search_function_project/my_home_pages.dart';
import 'package:search_function_project/progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CustomStepper(),
    );
  }
}

