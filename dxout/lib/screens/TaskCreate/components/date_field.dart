import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String labelName;
  final String hintText;
  // Variable para guardar el texto
  final TextEditingController controller;
  final TextInputType inputType;
  const DateField(
      {Key? key,
      required this.controller,
      required this.labelName,
      required this.hintText,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelName,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        TextFieldContainer(
            child: TextField(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2023),
                lastDate: DateTime(2100));
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              controller.text = formattedDate;
            } else {}
          },
          style: const TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          controller: controller,
          keyboardType: inputType,
        ))
      ],
    ));
  }
}
