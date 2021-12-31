import 'package:flutter/material.dart';
import 'package:frontend/services/utility/dialog.dart';
import 'package:frontend/models/famille.dart';
import 'package:frontend/services/family/familyservice.dart';

class AddFamily extends StatefulWidget {
  const AddFamily({Key? key}) : super(key: key);
  @override
  State<AddFamily> createState() => _MyFamilyState();
}

class _MyFamilyState extends State<AddFamily> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nomFamille;

  @override
  Widget build(BuildContext mycontext) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter le nom de la famile',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "S'il vous plait tapez un nom de famille";
              }
              setState(() {
                nomFamille = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 130.0,
            child: (
                FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool state =
                        await Familyservice.add(Famille(familyname: nomFamille));
                        await MyDialog.fullDialog(
                            context, state ? "INSERT SUCCESS" : "FAMILY EXISTS");
                        Familyservice.getAllFamily();
                        if (state) {
                          Navigator.pushNamed(context, '/listFamily');
                        }
                      }
                    },
                  child: const Text(
                    'Ajouter',
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
          ),
    );
  }
}
