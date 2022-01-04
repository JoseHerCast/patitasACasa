import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

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
  late var phoneNumber;

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
          child: Text(
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
          padding: EdgeInsets.all(16),
          children: [
            buildDoggieName("Doggiename"),
            SizedBox(height: 16),
            buildAge("Edad"),
            SizedBox(height: 16),
            buildLastView("Lugar de extravío"),
            SizedBox(height: 16),
            buildEmail("Correo"),
            SizedBox(height: 16),
            buildPhoneNumber("Número de teléfono"),
            SizedBox(height: 16),
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
        border: OutlineInputBorder(),
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
        border: OutlineInputBorder(),
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
        border: OutlineInputBorder(),
      ),
      onSaved: (value) => setState(() => lastView = value!),
    );
  }

  Widget buildEmail(String title) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
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
        border: OutlineInputBorder(),
      ),
      initialCountryCode: 'MX',
      searchText: "Buscar por país",
      onSaved: (value) => setState(() => phoneNumber = value!),
    );
  }

  Widget submit(String title) {
    return TextButton(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
        }
      },
      child: Text("Submit"),
    );
  }
}
