import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/auth/auth_service.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:regexpattern/regexpattern.dart';

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/compte.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Nom d'utilisateur",
                                  fillColor: const Color.fromRGBO(239, 231, 231, 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Nom d'utilisateur ne peut pas etre vide";
                                }
                                setState(() {
                                  username = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.mail),
                                  hintText: "Adresse mail",
                                  fillColor: Color.fromRGBO(239, 231, 231, 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Adress mail ne peut pas être vide';
                                }
                                if (!value.isEmail()) {
                                  return "S'il vous plait tapez une adresse mail valide";
                                }
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Mot de passe",
                                  fillColor: Color.fromRGBO(239, 231, 231, 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mot de passe ne peut pas être vide';
                                }
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Confirmer votre mot de passe",
                                  fillColor: Color.fromRGBO(239, 231, 231, 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mot de passe ne peut pas être vide';
                                }
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height:30,
                            ),
                            Container(
                              margin: EdgeInsets.all(30),
                              width: double.infinity,
                              child: (
                                  FlatButton(
                                    child: const Text("Créer votre compte",
                                      style: TextStyle(color:Colors.black,fontSize: 20),),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        bool state =
                                        await AuthService.register(User(
                                            username: username!,
                                            email: email!,
                                            password: password!));
                                        if (state) {
                                          await MyDialog.fullDialog(
                                              context, "Votre compte à été bien créé");
                                          Navigator.pushNamed(
                                              context, "/login");
                                          return;
                                        }
                                        MyDialog.fullDialog(
                                            context, "Ce compte existe déja");
                                      }
                                    },
                                  )
                              ),
                              decoration: BoxDecoration(
                                color:const Color.fromRGBO(175, 126, 175, 1),
                                borderRadius: BorderRadius.circular(30.0),
                              ),

                            ),

                        ])
                      ))]),
                    )
            )],
                ),
              ),
            );
  }
}
