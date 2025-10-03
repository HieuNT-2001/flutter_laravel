import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      width: 200,
      height: 200,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red, width: 3),
      ),
      transform: Matrix4.rotationZ(0.4),
      child: const Text(
        "TinCoder",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
