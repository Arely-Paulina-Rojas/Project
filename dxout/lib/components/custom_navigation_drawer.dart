import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/task_create_screen.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildItemsMenu(context)
              ]),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: menuColor,
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
        child: Column(children: [
          // Parte de la imagen
          Image.asset(
            'assets/images/chanel.png',
            width: 80,
          ),
        ]),
      );

  Widget buildItemsMenu(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Pantalla Principal'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            title: const Text('Listas permitidas / Perfiles'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('Fijar temporizador de bloqueo'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.checklist_outlined),
            title: const Text('Lista de pendientes'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black54,
            height: 0.5,
            thickness: 0.5,
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Acerca de'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Ajustes'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TaskCreateScreen())),
          ),
        ],
      ));
}
