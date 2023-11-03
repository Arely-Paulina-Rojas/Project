import 'package:dxout/components/custom_navigation_drawer.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/taskcreate_body.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lista de pendientes")),
        drawer: const CustomNavigationDrawer(),
        backgroundColor: menuColor,
        body: TaskCreateBody(
          key: key,
        ));
  }
}
