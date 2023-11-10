import 'package:another_flushbar/flushbar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dxout/components/custom_button.dart';
import 'package:dxout/constants.dart';
import 'package:dxout/screens/TaskCreate/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

class TimerBodyScreen extends StatefulWidget {
  const TimerBodyScreen({Key? key}) : super(key: key);

  @override
  State<TimerBodyScreen> createState() => _TimerBodyScreeState();
}

class _TimerBodyScreeState extends State<TimerBodyScreen> {
  int customDuration = 1800;
  final CountDownController _controller = CountDownController();
  TextEditingController customDurationController = TextEditingController();

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
                FlutterDnd.setInterruptionFilter(
                    FlutterDnd.INTERRUPTION_FILTER_NONE);
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
                  FlutterDnd.setInterruptionFilter(
                      FlutterDnd.INTERRUPTION_FILTER_NONE);
                  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
                  setState(() {});
                },
                textColor: backgroundColor,
                buttonColor: menuColor),
            const SizedBox(height: 30),
            const Text(
              'Modo temporizador esta pensado para aquellos con menos fuerza de volutad ante distracciones. Así que elige una cantidad de tiempo razonable.',
              textAlign: TextAlign.justify,
            )
          ]),
    ));
  }

  void _inputAlertDialog(context, textFieldController) {
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
                controller: textFieldController,
              ),
              TextButton(
                  child: const Text(
                    "Establecer",
                    style: TextStyle(color: textColor),
                  ),
                  onPressed: () {
                    if (validateForm(customDurationController.text)) {
                      if (validateNumber(customDurationController.text)) {
                        int tempTime = int.parse(customDurationController.text);
                        if (validateTime(tempTime)) {
                          customDuration = convertTime(tempTime);
                          Navigator.of(context).pop();
                          setState(() {
                            _controller.restart(duration: customDuration);
                            _controller.reset();
                          });
                        } else {
                          Flushbar(
                            backgroundColor: menuColor,
                            message: "¡El tiempo máximo es de 30 minutos!",
                            duration: const Duration(seconds: 3),
                          ).show(context);
                        }
                      } else {
                        Flushbar(
                          backgroundColor: menuColor,
                          message: "Ingrese solo números enteros",
                          duration: const Duration(seconds: 3),
                        ).show(context);
                      }
                    } else {
                      Flushbar(
                        backgroundColor: menuColor,
                        message: "¡Campo vacío!",
                        duration: const Duration(seconds: 3),
                      ).show(context);
                    }
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

  int convertTime(int newTime) {
    int minutes = newTime * 60;
    return minutes;
  }

  bool validateForm(String time) {
    if (time.isNotEmpty) return true;
    return false;
  }

  bool validateNumber(String time) {
    if (int.tryParse(time) == null) return false;
    return true;
  }

  bool validateTime(int time) {
    if (time <= 30) return true;
    return false;
  }
}
