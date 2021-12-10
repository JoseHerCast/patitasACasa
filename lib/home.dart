import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/screens/welcome/components/body.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
