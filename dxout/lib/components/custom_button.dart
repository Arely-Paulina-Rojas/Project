import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color textColor;
  final Color buttonColor;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.7,
        // Size.height es el largo total de la pantalla y se multiplica con un valor menor para que sea "adaptativo"
        height: 45,
        child: TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(text, style: const TextStyle(color: backgroundColor)),
        ));
  }
}
