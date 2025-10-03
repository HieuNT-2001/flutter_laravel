import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/start/continue_button.dart';
import 'package:hoc_flutter/screens/start/customer_select.dart';
import 'package:hoc_flutter/screens/start/worker_select.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String role = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Bạn là Khách hay là Thợ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomerSelect(
              isSelected: role == "customer",
              onSelect: () => setState(() => role = "customer"),
            ),
            const SizedBox(height: 30),
            WorkerSelect(
              isSelected: role == "worker",
              onSelect: () => setState(() => role = "worker"),
            ),
            const SizedBox(height: 30),
            ContinueButton(role: role),
          ],
        ),
      ),
    );
  }
}
