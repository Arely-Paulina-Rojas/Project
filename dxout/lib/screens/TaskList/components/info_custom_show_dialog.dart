import 'package:dxout/constants.dart';
import 'package:dxout/database/common/task.dart';
import 'package:flutter/material.dart';

void infoCustomShowDialog(BuildContext context, Task task) {
  showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "DETALLES",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 450,
              margin: const EdgeInsets.symmetric(horizontal: 26),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: const BoxDecoration(color: backgroundColor),
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "DETALLES",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            task.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: menuColor),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Fecha Límite:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: cardTextColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            task.deathDate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Estado:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: cardTextColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            getStatus(task.isComplete),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Notas:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: cardTextColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            task.notes,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          /*const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16)),*/
                        ],
                      ),
                    ],
                  )),
            ),
          ));
}

String getStatus(String status) {
  if (status == 'true') return 'Completada';
  return 'Pendiente';
}
