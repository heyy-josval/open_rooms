import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Door extends StatefulWidget {
  const Door({super.key});

  @override
  State<Door> createState() => _DoorState();
}

String? roomName;
String? reStart;
String? reEnd;
bool? isOpen;
String? error;
String? pin;
TextEditingController? pinController;

class _DoorState extends State<Door> {
  @override
  void initState() {
    super.initState();
    roomName = "Lab. Informática";
    reStart = "14:00";
    reEnd = "16:00";
    isOpen = false;
    pin = "123456";
    pinController = TextEditingController();
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.blue),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Reserva en $roomName",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Desde las $reStart hasta las $reEnd",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Ingrese su PIN",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Pinput(
                      controller: pinController,
                      defaultPinTheme: defaultPinTheme,
                      isCursorAnimationEnabled: true,
                      length: 4,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
