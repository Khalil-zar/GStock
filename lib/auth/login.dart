import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/auth/auth_service.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:regexpattern/regexpattern.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bienvenue.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      margin: const EdgeInsets.only(top:20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Nom d'utilisateur",
                                fillColor: Color.fromRGBO(239, 231, 231, 10),
                                filled: true,
                                 ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Le nom d''utlisateur ne peut pas être vide';
                                }
                                if (!value.isEmail()) {
                                  return 'Entrer votre nom d''utlisateur';
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
                              enableSuggestions: false,
                              obscureText: true,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                  prefixIcon: Icon(Icons.lock),
                                fillColor: Color.fromRGBO(239, 231, 231, 10),
                                  filled: true,
                                  hintText: "Mot de passe",
                                  ),
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
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.all(30),
                              width: double.infinity,
                              child: (
                                FlatButton(
                                    child: const Text("Connexion",
                                      style: TextStyle(color:Colors.black,fontSize: 20),),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final bool state =
                                        await AuthService.login(
                                            User.instance(
                                                email!, password!));
                                        if (state) {
                                          Navigator.pushNamed(
                                              context, "/home");
                                          return;
                                        }
                                        await MyDialog.fullDialog(
                                            context, "Information Incorrect");
                                      }
                                    },
                                )
                              ),
                              decoration: BoxDecoration(
                                color:const Color.fromRGBO(175, 126, 175, 1),
                                borderRadius: BorderRadius.circular(30.0),
                              ),

                            ),

                            Container(
                              width: 330.0,
                              child: (
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: const Text(
                                    'Créer Compte',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                )),
                              decoration: BoxDecoration(
                              color:const Color.fromRGBO(175, 126, 175, 1),
                                borderRadius: BorderRadius.circular(30.0),
                                ),
                            )],
                            )))
                      ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}
