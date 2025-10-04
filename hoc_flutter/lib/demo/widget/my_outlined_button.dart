import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: OutlinedButton.icon(
        // onPressed: () {
        //   print("Outlined Button Pressed");
        // },
        onPressed: null,
        // style: OutlinedButton.styleFrom(
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        //   minimumSize: const Size(300, 50),
        //   padding: const EdgeInsets.all(20),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(50),
        //   ),
        //   shadowColor: Colors.purple,
        //   elevation: 10,
        //   side: const BorderSide(color: Colors.yellow, width: 3),
        //   disabledBackgroundColor: Colors.grey,
        //   disabledForegroundColor: Colors.white,
        // ),
        label: const Text('Outlined Button', style: TextStyle(fontSize: 28)),
        icon: const Icon(Icons.delete, size: 32),
      ),
    );
  }
}
