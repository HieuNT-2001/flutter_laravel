import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: TextButton.icon(
        // onPressed: () {
        //   print("Text Button pressed");
        // },
        onPressed: null,
        // style: TextButton.styleFrom(
        //   backgroundColor: Colors.green,
        //   foregroundColor: Colors.white,
        //   // minimumSize: const Size(240, 80),
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
        label: const Text("Text Button", style: TextStyle(fontSize: 28)),
        icon: const Icon(Icons.edit, size: 32),
      ),
    );
  }
}
