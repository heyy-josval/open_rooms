import 'package:flutter/material.dart';

class Door extends StatefulWidget {
  const Door({super.key});

  @override
  State<Door> createState() => _DoorState();
}

class _DoorState extends State<Door> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Door"),
        ),
      ),
    );
  }
}
