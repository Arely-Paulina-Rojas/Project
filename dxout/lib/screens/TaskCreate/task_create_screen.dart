import 'package:dxout/components/custom_button.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:dxout/screens/TaskCreate/components/input_field.dart';
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
              press: () {},
              textColor: backgroundColor,
              buttonColor: menuColor,
            )
          ]),
    ));
  }
}
