import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/introduction/continue_button.dart';
import 'package:hoc_flutter/screens/introduction/introduction3.dart';
import 'package:hoc_flutter/screens/introduction/skip_button.dart';

class Introduction2 extends StatelessWidget {
  final String role;
  const Introduction2({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/yard.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Tiếng việt'),
                  icon: const Icon(Icons.language),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue[900],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                role == 'customer'
                    ? 'Bất cứ việc gì\nBất cứ nơi đâu'
                    : 'Công việc linh động',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: role == 'customer' ? Colors.black : Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              ?role != 'customer'
                  ? Text(
                      'Làm việc mọi lúc, mọi nơi, tăng\nthu nhập không giới hạn.',
                      style: TextStyle(color: Colors.blue[900], fontSize: 16),
                      textAlign: TextAlign.center,
                    )
                  : null,
              const Spacer(),
              Row(
                children: [
                  Expanded(child: SkipButton(role: role)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ContinueButton(
                      role: role,
                      label: 'Tiếp tục',
                      targetPage: Introduction3(role: role),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
