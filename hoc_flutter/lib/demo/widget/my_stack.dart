import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 500,
      height: 500,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        // textDirection: TextDirection.rtl,
        clipBehavior: Clip.none,
        children: [
          Container(color: Colors.blue, width: 300, height: 300),
          Positioned(
            left: 10,
            top: 10,
            child: Container(color: Colors.green, width: 200, height: 700),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(color: Colors.pink, width: 100, height: 100),
          ),
          Container(color: Colors.yellow, width: 70, height: 70),
          Container(color: Colors.red, width: 50, height: 50),
        ],
      ),
    );
  }
}
