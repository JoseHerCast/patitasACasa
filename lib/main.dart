import 'package:flutter/material.dart';
import 'package:proyecto_final/constants.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patitas a casa',
      theme: ThemeData(
        scaffoldBackgroundColor: verdePatitas,
      ),
      home: const login(title: 'Login'),
    );
  }
}
