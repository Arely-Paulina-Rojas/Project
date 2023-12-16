import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/task_create_screen.dart';
import 'package:dxout/screens/TaskList/task_list_screen.dart';
import 'package:flutter/material.dart';

class TaskMainScreen extends StatelessWidget {
  const TaskMainScreen({Key? key}) : super(key: key);
  //NotificationService notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: menuColor,
              title: const Text("Lista de pendientes"),
              bottom: const TabBar(
                  tabs: [Tab(text: "Pendientes"), Tab(text: "Crear nuevo")]),
            ),
            drawer: const CustomNavigationDrawer(),
            body: TabBarView(children: [
              TaskListScreen(
                key: key,
              ),
              TaskCreateScreen(
                key: key,
              ),
            ])));
  }
}
