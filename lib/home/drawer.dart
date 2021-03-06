import 'package:flutter/material.dart';

/*class MonDrawer extends StatefulWidget {
  const MonDrawer({ Key? key }) : super(key: key);

  @override
  _MonDrawerState createState() => _MonDrawerState();
}

class _MonDrawerState extends State<MonDrawer> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> key = GlobalKey();
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                ),
                accountEmail: Text('jane.doe@example.com'),
                accountName: Text(
                  'Jane Doe',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text(
                  'Ajouter Famille',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  setState(() {
                    isDialOpen.value = false;
                  });
                  key.currentState!.pushNamed('/addFamily');
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Liste des familles',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  setState(() {
                    isDialOpen.value = false;
                  });
                  key.currentState!.pushNamed('/listFamily');
                },
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Ajouter un Composant',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  setState(() {
                    isDialOpen.value = false;
                  });
                  key.currentState!.pushNamed('/addMaterial');
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Composants Emprunt??s',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  setState(() {
                    isDialOpen.value = false;
                  });
                  key.currentState!.pushNamed('/listMember');
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Liste des composants',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  setState(() {
                    isDialOpen.value = false;
                  });
                  key.currentState!.pushNamed('/listMaterial');
                },
              ),

            ],
          ),
        ));
  }
}*/
Drawer _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
          ),
          accountEmail: Text('jane.doe@example.com'),
          accountName: Text(
            'Jane Doe',
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.house),
          title: const Text(
            'Houses',
            style: TextStyle(fontSize: 24.0),
          ),
          /*onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyHomePage(
                  title: 'Houses',
                ),
              ),
            );
          },*/
        ),
        ListTile(
          leading: const Icon(Icons.apartment),
          title: const Text(
            'Apartments',
            style: TextStyle(fontSize: 24.0),
          ),
          onTap: () {
            /*Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyHome(
                  title: 'Apartments',
                ),
              ),
            );
          },*/
          } ),
        ListTile(
          leading: const Icon(Icons.house_outlined),
          title: const Text(
            'Townhomes',
            style: TextStyle(fontSize: 24.0),
          ),
         /* onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyHomePage(
                  title: 'Townhomes',
                ),
              ),
            );
          },*/
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text(
            'Favorites',
            style: TextStyle(fontSize: 24.0),
          ),
         /* onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyHomePage(
                  title: 'Favorites',
                ),
              ),
            );
          },*/
        ),
      ],
    ),
  );
}
