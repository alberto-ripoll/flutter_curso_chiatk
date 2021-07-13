import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final ServerController serverController;

  const MyDrawer({required this.serverController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/register",arguments: serverController.loggedUser);
            },
            accountName: Text(
              serverController.loggedUser!.nickname,
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(serverController.loggedUser!.nickname),
            currentAccountPicture: CircleAvatar(
                backgroundImage: FileImage(
              serverController.loggedUser!.photo,
            )),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text(
              "Mis recetas",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(Icons.book, color: Colors.green),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/user_recipes');
            },
          ),
          ListTile(
            title: Text(
              "Mis favoritos",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(Icons.favorite, color: Colors.red),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/favorites');
            },
          ),
          ListTile(
            title: Text(
              "Cerrar sesión",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(Icons.power_settings_new, color: Colors.cyan),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/");
            },
          )
        ],
      ),
    );
  }

}
