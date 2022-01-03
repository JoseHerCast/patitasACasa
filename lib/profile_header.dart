import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patitas_a_casa/screens/settings.dart';
import 'components/gradient_background.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:patitas_a_casa/login.dart';
import 'package:path_provider/path_provider.dart';

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

String appDirectory = "";
bool imageTaken = false;

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
  late XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    if (!imageTaken) {
      downloadUserImage();
    }

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
                      backgroundImage:
                          const AssetImage("assets/img/default.jpeg"),
                      foregroundImage: Image.file(
                              File("$appDirectory/${uid.toString()}.jpg"))
                          .image),
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const Text(
                                      "Elige tu imagen",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Lato-Regular",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            right: 20,
                                          ),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              takePhoto(ImageSource.camera);
                                            },
                                            icon: const Icon(Icons.camera),
                                            label: const Text(
                                              "Camara",
                                              style: TextStyle(
                                                fontFamily: "Lato-Regular",
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              takePhoto(ImageSource.gallery);
                                            },
                                            icon: const Icon(Icons.image),
                                            label: const Text(
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
      imageTaken = true;
      imageFile = pickedFile;
      String newPath = '$appDirectory/${uid.toString()}.jpg';
      File(imageFile!.path).renameSync(newPath);
      debugPrint("Nueva foto copiada a $newPath");
      uploadImage(imageFile!);
      Navigator.pop(context);
    });
  }

  //Upload of User Image
  Future<void> uploadImage(XFile pickedFile) async {
    String filePath = pickedFile.path;
    await uploadFile(filePath);
    imageTaken = true;
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('${uid.toString()}/userImage.jpg')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      e.code == 'canceled';
    }
  }

  //Download of the User Image
  Future<void> downloadUserImage() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDirectory = appDocDir.path;
    debugPrint("Obtenemos la ruta de la app");
    File downloadToFile = File('${appDocDir.path}/${uid.toString()}.jpg');
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('${uid.toString()}/userImage.jpg')
          .writeToFile(downloadToFile);
      debugPrint(
          "Imagen ${uid.toString()}/userImage.jpg descargada en $downloadToFile");
    } on firebase_core.FirebaseException catch (e) {
      e.code == 'canceled';
      debugPrint(e.toString());
    }
  }
}
