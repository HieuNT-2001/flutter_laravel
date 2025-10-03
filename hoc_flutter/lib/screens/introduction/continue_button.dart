import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String role;
  final String label;
  final Widget targetPage;

  const ContinueButton({
    super.key,
    required this.role,
    required this.label,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: role == "customer" ? Colors.black : Colors.white,
        backgroundColor: role == "customer" ? Colors.amber : Colors.blue[900],
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
