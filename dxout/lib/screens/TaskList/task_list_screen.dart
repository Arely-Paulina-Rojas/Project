import 'package:dxout/database/common/task.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:dxout/screens/TaskList/components/task_list.dart';
import 'package:flutter/material.dart';

List<Task> testTaskList = [
  Task(1, "Comer", "9 NOV 2023", false),
  Task(2, "Terminar aplicación", "25 NOV 2023", true)
];

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Column(children: <Widget>[yourTaskList(context)]),
    ));
  }

  Widget yourTaskList(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TaskList(
              key: key,
              tasks: testTaskList,
            ))
      ],
    );
  }
}
