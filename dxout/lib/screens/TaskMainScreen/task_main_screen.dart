import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/task_create_screen.dart';
import 'package:flutter/material.dart';

class TaskMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Lista de pendientes"),
              bottom: const TabBar(
                  tabs: [Tab(text: "Pendientes"), Tab(text: "Crear nuevo")]),
            ),
            drawer: const CustomNavigationDrawer(),
            backgroundColor: menuColor,
            body: TabBarView(children: [
              TaskCreateScreen(
                key: key,
              ),
              TaskCreateScreen(
                key: key,
              ),
            ])));
  }
}
