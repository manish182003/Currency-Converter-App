import 'package:currency_converter_app/screens/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Exchange App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: home()
    );
  }
}
