import 'package:patitas_a_casa/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentReference usuario =
        FirebaseFirestore.instance.collection('Usuarios').doc(uid.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajustes",
          style: TextStyle(
            fontFamily: "Lato-Regular",
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SettingsOption(
                description: "Cambiar nombre de perfil",
                hint: "Nuevo Nombre",
                icon: Icons.person,
                submit: (String enteredValue) {
                  usuario
                      .update({'name': enteredValue})
                      .then((value) => debugPrint(
                          "Valor de nombre actualizado a $enteredValue"))
                      .catchError((error) =>
                          debugPrint("Error al actualizar el nombre: $error"));
                },
              ),
              SettingsOption(
                description: "Cambiar Ciudad",
                hint: "Nueva Ciudad",
                icon: Icons.add_location,
                submit: (String enteredValue) {
                  usuario
                      .update({'city': enteredValue})
                      .then((value) => debugPrint(
                          "Valor de ciudad actualizado a $enteredValue"))
                      .catchError((error) =>
                          debugPrint("Error al actualizar la ciudad: $error"));
                },
              ),
              SettingsOption(
                description: "Cambiar Descripción",
                hint: "Nueva Descripción",
                icon: Icons.article_rounded,
                submit: (String enteredValue) {
                  usuario
                      .update({'description': enteredValue})
                      .then((value) => debugPrint(
                          "Valor de descripción actualizada a $enteredValue"))
                      .catchError((error) => debugPrint(
                          "Error al actualizar la descripción: $error"));
                },
              ),
              SettingsOption(
                description: "Cerrar sesion",
                hint: "Sign Out",
                icon: Icons.exit_to_app,
                submit: (String enteredValue) async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen(), //Return to Login
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  SettingsOption({
    required this.description,
    required this.hint,
    required this.icon,
    required this.submit(String enteredValue),
    Key? key,
  }) : super(key: key);
  final String description;
  final String hint;
  final IconData icon;
  final Function submit;
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withAlpha(50),
          ),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        onPressed: () {
          if (hint != "Sign Out") {
            showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                        //insetPadding: EdgeInsets.zero,
                        contentTextStyle: const TextStyle(
                            fontFamily: "Lato-Regular", fontSize: 20),
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                labelText: hint),
                            controller: inputController,
                          )
                        ]),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                submit(inputController.text);
                                Navigator.pop(context);
                              },
                              child: const Text("Actualizar")),
                        ]));
          } else {
            submit("Cerrar Sesión");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: "Lato-Regular",
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Icon(icon),
            ),
          ],
        ),
      ),
    );
  }
}
