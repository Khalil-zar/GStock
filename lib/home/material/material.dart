import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:frontend/services/utility/router.dart';

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  State<MyMaterial> createState() => MyMaterialState();
}

class MyMaterialState extends State<MyMaterial> {
  final GlobalKey<NavigatorState> key = GlobalKey();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          body: Navigator(
            key: key,
            initialRoute: '/listMaterial',
            onGenerateRoute: materialRoute,
          ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            openCloseDial: isDialOpen,
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromRGBO(255, 175, 244, 1),
            overlayColor: Colors.grey,
            overlayOpacity: 0.5,
            spacing: 15,
            spaceBetweenChildren: 15,
            closeManually: true,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.list),
                  label: 'List Material',
                  backgroundColor:  const Color.fromRGBO(249, 210, 244, 1),
                  foregroundColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isDialOpen.value = false;
                    });
                    key.currentState!.pushNamed('/listMaterial');
                  }),
              SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: 'Ajouter Material',
                  backgroundColor:  const Color.fromRGBO(249, 210, 244, 1),
                  foregroundColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isDialOpen.value = false;
                    });
                    key.currentState!.pushNamed('/addMaterial');
                  }),
              SpeedDialChild(
                  child: const Icon(Icons.assignment_return),
                  label: 'Tous les materiels empruntés',
                  backgroundColor:  const Color.fromRGBO(249, 210, 244, 1),
                  foregroundColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isDialOpen.value = false;
                    });
                    key.currentState!.pushNamed('/listMember');
                  }),
            ],
          )),
    );
  }
}
