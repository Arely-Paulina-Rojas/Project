import 'package:dxout/constants.dart';
import 'package:dxout/database/common/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  //final Task task;
  //_TaskCardState({required this.task}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.0),
      child: Container(
        decoration: _boxDecoration(),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_taskInfoTexts(context), optionIcons(context)],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: cardColor, border: Border.all(color: borderCardColor));
  }

  Widget _taskInfoTexts(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.task.name,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Fecha Límite:",
            style: TextStyle(fontWeight: FontWeight.bold, color: cardTextColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.task.deathDate,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: cardTextColor),
          ),
        ],
      ),
    );
  }

  Widget optionIcons(context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
                child: const Icon(Icons.search, color: hintColor),
                onTap: () {}),
            const SizedBox(height: 3),
            Checkbox(
              activeColor: menuColor,
              value: widget.task.isComplete,
              onChanged: (value) {
                setState(() {
                  if (widget.task.isComplete) {
                    widget.task.isComplete = false;
                  } else {
                    widget.task.isComplete = true;
                  }
                });
              },
            ),
          ],
        ));
  }
}
