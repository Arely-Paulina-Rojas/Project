import 'package:dxout/screens/TaskCreate/components/taskcreate_body.dart';
import 'package:flutter/material.dart';

class TaskCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TaskCreateBody(
      key: key,
    ));
  }
}
