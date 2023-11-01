import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/text_field_container.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelName;
  final String hintText;
  // Variable para guardar el texto
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final TextInputType inputType;
  const InputField(
      {Key? key,
      required this.maxLines,
      required this.onChanged,
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
          maxLines: maxLines,
          style: const TextStyle(color: textColor),
          onChanged: onChanged,
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
