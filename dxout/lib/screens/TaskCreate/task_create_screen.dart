import 'package:another_flushbar/flushbar.dart';
import 'package:dxout/components/custom_button.dart';
import 'package:dxout/database/common/task.dart';
import 'package:dxout/database/db_helper.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:dxout/screens/TaskCreate/components/input_field.dart';
import 'package:dxout/services/notification_service.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'components/date_field.dart';

class TaskCreateScreen extends StatelessWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController activityName = TextEditingController();
    TextEditingController deathDate = TextEditingController();
    TextEditingController notes = TextEditingController();

    //Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(32),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
                onChanged: (value) {},
                maxLines: 1,
                controller: activityName,
                labelName: 'Nombre de la actividad:',
                hintText: 'Nombre del pendiente',
                inputType: TextInputType.text),
            DateField(
                controller: deathDate,
                labelName: 'Fecha límite:',
                hintText: 'Ingrese la Death Date',
                inputType: TextInputType.datetime),
            InputField(
                onChanged: (value) {},
                maxLines: 8,
                controller: notes,
                labelName: 'Notas Adicionales:',
                hintText: '',
                inputType: TextInputType.multiline),
            CustomButton(
              text: 'Añadir actividad',
              press: () async {
                if (validateForm(activityName.text, deathDate.text)) {
                  final task = Task(null, activityName.text, deathDate.text,
                      notes.text, 'false');
                  await SQLHelper.createTask(task);
                  await NotificationService.cancelNotifications();
                  String pendingTask = await SQLHelper.getPendingTask();
                  if (pendingTask != '0') {
                    await NotificationService.showNotification(
                      title: "Ponte a trabajar",
                      body: "Tienes $pendingTask tareas pendientes",
                      scheduled: true,
                      interval: 60,
                    );
                  }
                  activityName.clear();
                  deathDate.clear();
                  notes.clear();
                  Flushbar(
                    backgroundColor: menuColor,
                    message: "Pendiente guardado con éxito",
                    duration: const Duration(seconds: 3),
                  ).show(context);
                } else {
                  Flushbar(
                    backgroundColor: menuColor,
                    message: "Es necesario un nombre y fecha límite",
                    duration: const Duration(seconds: 3),
                  ).show(context);
                }
              },
              textColor: backgroundColor,
              buttonColor: menuColor,
            )
          ]),
    ));
  }
}

bool validateForm(String name, String date) {
  if (name.isNotEmpty && date.isNotEmpty) return true;
  return false;
}
