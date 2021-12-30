import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patitas_a_casa/screens/settings.dart';
import 'components/gradient_background.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    Key? key,
    required this.userName,
    required this.eMail,
  }) : super(key: key);

  final String userName;
  final String eMail;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late XFile? imageFile = null;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const GradientBack("Perfil"),
        Positioned(
          top: 110,
          left: 40,
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: imageFile == null
                        ? AssetImage("assets/img/profile.jpg")
                        : Image.file(File(imageFile!.path)).image,
                  ),
                  Positioned(
                    left: -5,
                    top: 60,
                    child: FloatingActionButton(
                      //Estilo del boton
                      backgroundColor: Colors.orange.withAlpha(150),
                      mini: true,
                      tooltip: "Editar",
                      child: const Icon(
                        Icons.create,
                        size: 20,
                        color: Colors.white,
                      ),
                      //Funcionalidad
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Elige tu imagen",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Lato-Regular",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 20,
                                          ),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              takePhoto(ImageSource.camera);
                                            },
                                            icon: Icon(Icons.camera),
                                            label: Text(
                                              "Camara",
                                              style: TextStyle(
                                                fontFamily: "Lato-Regular",
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              takePhoto(ImageSource.gallery);
                                            },
                                            icon: Icon(Icons.image),
                                            label: Text(
                                              "Galería",
                                              style: TextStyle(
                                                fontFamily: "Lato-Regular",
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      widget.userName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: "Lato-Regular",
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      widget.eMail,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: "Lato-Regular",
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 225,
          left: MediaQuery.of(context).size.width / 16,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    ),
                    const Text(
                      "Ajustes",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.lightbulb,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      "Nueva alerta",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.pets),
                      onPressed: () {},
                    ),
                    const Text(
                      "Mis doggies",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile;
      Navigator.pop(context);
    });
  }
}
