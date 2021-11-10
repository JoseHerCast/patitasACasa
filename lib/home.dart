import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Color verdePatitas = const Color(0xff27b04d);
Color cafePatitas = const Color(0xff846732);
Color ocrePatitas = const Color(0xffd89916);

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
    return Scaffold(
      body: Flex(
        mainAxisSize: MainAxisSize.max,
        direction: Axis.horizontal,
        children: [
          //Degradado del fondo
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 50,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [verdePatitas, cafePatitas],
                  stops: [0.15, 0.75],
                ),
              ),
              child: Column(
                children: [
                  //logo
                  Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Image.asset(
                      "../assets/patitas.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  //login
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Icon(Icons.lock_clock),
                                ),
                                Container(
                                  child: const Text(
                                    "User",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Icon(Icons.remove_red_eye),
                                ),
                                Container(
                                  child: const Text(
                                    "Password",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //login button
                  Container(
                    height: 30,
                    width: 200,
                    decoration: BoxDecoration(
                      color: cafePatitas,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
