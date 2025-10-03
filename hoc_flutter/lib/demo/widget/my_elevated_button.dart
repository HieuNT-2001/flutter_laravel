import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: ElevatedButton.icon(
        // onPressed: () {
        //   print("Elevated Button pressed");
        // },
        onPressed: null,
        // style: ElevatedButton.styleFrom(
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
        label: const Text("Elevated Button", style: TextStyle(fontSize: 28)),
        icon: const Icon(Icons.edit, size: 32),
      ),
    );
  }
}
