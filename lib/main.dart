import 'package:flutter/material.dart';
import 'package:jsoncard/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.cyan[50],
      ),
      home: const MyHomePage(),
    );
  }
}
