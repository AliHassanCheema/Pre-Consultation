import 'package:flutter/material.dart';

import 'pre_consultation/pre_consultation_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHI Health Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PreConsultationScreen(),
    );
  }
}
