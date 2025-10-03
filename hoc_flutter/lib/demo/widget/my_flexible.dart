import 'package:flutter/material.dart';

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(color: Colors.red, height: 100),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Container(color: Colors.orange),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(color: Colors.blue),
        ),
      ],
    );
  }
}
