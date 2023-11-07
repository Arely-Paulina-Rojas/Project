import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/screens/CustomList/custom_list_screen.dart';
import 'package:dxout/screens/TaskCreate/task_create_screen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ProfileMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Listas / Perfiles"),
              bottom: const TabBar(tabs: [
                Tab(text: "Personalizado"),
                Tab(text: "Modo Social"),
                Tab(text: "Sin Juegos")
              ]),
            ),
            drawer: const CustomNavigationDrawer(),
            backgroundColor: menuColor,
            body: TabBarView(children: [
              CustomListScreen(key: key),
              TaskCreateScreen(
                key: key,
              ),
              TaskCreateScreen(
                key: key,
              )
            ])));
  }
}
