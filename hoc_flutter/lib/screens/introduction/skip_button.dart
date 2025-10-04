import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/home.dart';

class SkipButton extends StatelessWidget {
  final String role;
  const SkipButton({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(role: role)),
      ),
      style: TextButton.styleFrom(
        foregroundColor: role == 'customer' ? Colors.amber : Colors.blue[900],
      ),
      child: const Text(
        'Bỏ qua',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
