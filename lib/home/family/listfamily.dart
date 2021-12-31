import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/famille.dart';
import 'package:frontend/services/family/familyservice.dart';

class ListFamily extends StatefulWidget {
  const ListFamily({Key? key}) : super(key: key);
  @override
  State<ListFamily> createState() => _ListFamily();
}

class _ListFamily extends State<ListFamily> {
  String? nomF;

  @override
  Widget build(BuildContext mycontext) {
    return FutureBuilder(
        future: Familyservice.getAllFamily(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Famille>> projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none ||
              !projectSnap.hasData) {
            return const Text("NO DATA");
          }
          return ListView.builder(
              itemCount: projectSnap.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 200,padding: const EdgeInsets.all(10.0),
                    child : Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.handyman, size: 60),
                            title: Text(projectSnap.data![index].familyname!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800,color: Colors.black)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Voir les matériaux',style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20),),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                );
              });
        });
  }
}
