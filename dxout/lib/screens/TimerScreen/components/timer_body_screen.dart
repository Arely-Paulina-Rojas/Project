import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dxout/components/custom_button.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:flutter/material.dart';

class TimerBodyScreen extends StatefulWidget {
  const TimerBodyScreen({Key? key}) : super(key: key);

  @override
  State<TimerBodyScreen> createState() => _TimerBodyScreeState();
}

class _TimerBodyScreeState extends State<TimerBodyScreen> {
  int customDuration = 1800;
  CountDownController _controller = CountDownController();
  TextEditingController customDurationController = TextEditingController();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(32),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _inputAlertDialog(context, customDurationController);
              },
              child: CircularCountDownTimer(
                autoStart: false,
                isReverse: true,
                controller: _controller,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: customDuration,
                fillColor: inputBorder,
                ringColor: hintColor,
                backgroundColor: menuColor,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: backgroundColor,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
              ),
            ),
            CustomButton(
                text: "Inicio",
                press: () {
                  _controller.start();
                  setState(() {});
                },
                textColor: backgroundColor,
                buttonColor: menuColor),
            const Text(
                'Modo temporizador esta pensado para aquellos con menos fuerza de volutad ante distracciones. Así que elige una cantidad de tiempo razonable.')
          ]),
    ));
  }

  void _inputAlertDialog(context, _textFieldController) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            title: const Text("Establecer tiempo",
                style: TextStyle(color: textColor)),
            content: const Text("Coloque el tiempo en minutos",
                style: TextStyle(color: textColor)),
            actions: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                controller: _textFieldController,
              ),
              TextButton(
                  child: const Text(
                    "Establecer",
                    style: TextStyle(color: textColor),
                  ),
                  onPressed: () {
                    customDuration =
                        convertTime(int.parse(customDurationController.text));
                    Navigator.of(context).pop();
                    setState(() {
                      _controller.restart(duration: customDuration);
                      _controller.reset();
                    });
                  }),
              TextButton(
                  child: const Text("Descartar",
                      style: TextStyle(color: textColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void validateTime() {}

  int convertTime(int newTime) {
    int minutes = newTime * 60;
    return minutes;
  }
}
