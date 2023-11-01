import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/taskcreate_body.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("Lista de pendientes")),
        backgroundColor: menuColor,
        body: TaskCreateBody(
          key: key,
        ));
  }
}
