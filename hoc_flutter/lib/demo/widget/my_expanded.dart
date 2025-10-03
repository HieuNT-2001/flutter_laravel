import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  const MyExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(flex: 1, child: Container(color: Colors.green, height: 150)),
          const SizedBox(width: 10),
          Expanded(flex: 2, child: Container(color: Colors.blue, height: 150)),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(color: Colors.orange, height: 150),
          ),
        ],
      ),
    );
  }
}
