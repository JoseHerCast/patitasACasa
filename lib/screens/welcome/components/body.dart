import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/welcome/components/background.dart';
import '/components/roundedButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Nos permite obtener el tamaño del contexto (pantalla del telefono)
    //para tener un diseño responsivo
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              "Bienvenido a casa",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: "Open-sans",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "assets/images/patitas.png",
              height: size.height * 0.3,
            ),
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {},
          ),
          RoundedButton(
            color: cafePatitas,
            text: "SIGN IN",
            press: () {},
          )
        ],
      ),
    );
  }
}

/*
Flex(
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
                      "assets/images/patitas.png",
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
      
      */