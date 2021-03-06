import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:patitas_a_casa/notification_api.dart';

class NewAlert extends StatefulWidget {
  const NewAlert({Key? key}) : super(key: key);

  @override
  State<NewAlert> createState() => _NewAlertState();
}

class _NewAlertState extends State<NewAlert> {
  final formKey = GlobalKey<FormState>();
  late String doggieName;
  late String doggieAge;
  late String lastView;
  late String email;
  late String doggieDescription;
  late PhoneNumber phoneNumber;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nueva alerta",
          style: TextStyle(
            fontFamily: "Lato-Regular",
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orange,
        leadingWidth: 72,
        leading: TextButton(
          child: const Text(
            "Cancelar",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato-Regular",
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildImage(),
            const SizedBox(height: 16),
            buildDoggieName("Doggiename"),
            const SizedBox(height: 16),
            buildAge("Edad"),
            const SizedBox(height: 16),
            buildLastView("Lugar de extravío"),
            const SizedBox(height: 16),
            buildEmail("Correo"),
            const SizedBox(height: 16),
            buildPhoneNumber("Número de teléfono"),
            const SizedBox(height: 16),
            buildDescription("Introduce una breve descripción"),
            const SizedBox(height: 16),
            submit("Crear alerta"),
          ],
        ),
      ),
    );
  }

  Widget buildDoggieName(String title) {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo requerido";
        } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Solo caracteres alfabéticos";
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => doggieName = value!),
    );
  }

  Widget buildAge(String title) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo requerido";
        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Solo caracteres Númericos";
        } else if (value.length > 2) {
          return "Solo se permiten dos digitos";
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => doggieAge = value!),
    );
  }

  Widget buildLastView(String title) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo requerido";
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => lastView = value!),
    );
  }

  Widget buildEmail(String title) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo requerido";
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
            .hasMatch(value)) {
          return "Correo inválido";
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => email = value!),
    );
  }

  Widget buildPhoneNumber(String title) {
    return IntlPhoneField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      initialCountryCode: 'MX',
      searchText: "Buscar por país",
      onSaved: (value) => setState(() => phoneNumber = value!),
    );
  }

  Widget buildDescription(String title) {
    return TextFormField(
      minLines: 5,
      maxLines: 10,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Campo requerido";
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => doggieDescription = value!),
    );
  }

  Widget buildImage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: InkWell(
        onTap: () {
          takePhoto(ImageSource.gallery);
        },
        child: Image(
          fit: BoxFit.contain,
          image: imageFile == null
              ? const AssetImage("assets/img/default2.jpg")
              : Image.file(
                  File(imageFile!.path),
                ).image,
        ),
      ),
    );
  }

  Widget submit(String title) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          NotificationApi.showNotification(
            title: 'Alerta creada',
            body: 'Se emtió la alerta para ' + doggieName,
          );
          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) => const NewAlert(),
            ),
          );
        }
      },
      child: const Text(
        "Submit",
        style: TextStyle(
          fontFamily: "Lato-Regular",
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }
}
