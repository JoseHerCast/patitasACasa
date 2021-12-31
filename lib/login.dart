import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'patitas_a_casa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Variable that saves the user's email for all the app
var uid = "";

FirebaseAuth auth = FirebaseAuth.instance;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Email: ${data.name}, Contraseña: ${data.password}');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name, password: data.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Este usuario no existe';
      } else if (e.code == 'wrong-password') {
        return 'Contraseña incorrecta';
      }
    }
    uid = data.name; //saves the email
    return null;
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Email: ${data.name}, Contraseña: ${data.password}');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name!, password: data.password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'La contraseña es muy débil!';
      } else if (e.code == 'email-already-in-use') {
        return 'Ya existe una cuenta con este correo';
      }
    } catch (e) {
      debugPrint("$e");
    }
    // Creates a document for the new user
    DocumentReference newUser =
        FirebaseFirestore.instance.collection('Usuarios').doc(data.name);
    newUser
        .set({
          'city': " ",
          'name': "usuario",
          'description': "Agrega una descripción aquí"
        })
        .then((value) => debugPrint("Usuario Agregado"))
        .catchError((error) => debugPrint("Error al agregar usuario: $error"));
    uid = data.name!; //saves the email
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    debugPrint('Email: $name');
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        return 'Correo inválido';
      } else if (e.code == 'auth/user-not-found') {
        return 'Ningún usuario registrado con este correo';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Patitas A Casa',
        logo: const AssetImage('assets/img/patitas.png'),
        onLogin: _authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                const PatitasACasa(), //Apilamos un listview con la descripción y el header con las imagenes de perritos cuando la sesión ya este iniciada
          ));
        },
        onRecoverPassword: _recoverPassword,
        messages: LoginMessages(
          userHint: 'Correo',
          passwordHint: 'Contraseña',
          confirmPasswordHint: 'Confirmar Contraseña',
          loginButton: 'INICIAR SESIÓN',
          signupButton: 'REGISTRARSE',
          forgotPasswordButton: 'Olvide mi contraseña',
          recoverPasswordButton: 'Enviar',
          goBackButton: 'ATRAS',
          confirmPasswordError: 'Las contraseñas no coinciden',
          recoverPasswordDescription:
              'Recibirás un correo para recuperar tu cuenta',
          recoverPasswordSuccess: 'Contraseña recuperada con éxito',
          recoverPasswordIntro: 'Recuperar contraseña',
        ),
        theme: LoginTheme(
          accentColor: Colors.green[900],
          primaryColor: Colors.deepOrange,
          errorColor: Colors.red,
          switchAuthTextColor: Colors.green[900],
        ));
  }
}
