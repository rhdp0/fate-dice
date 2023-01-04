import 'package:flutter/material.dart';

import 'fate_dices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fate Dices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FateDices(),
    );
  }
}
