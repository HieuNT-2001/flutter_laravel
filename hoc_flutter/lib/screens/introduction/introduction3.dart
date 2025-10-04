import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/home.dart';
import 'package:hoc_flutter/screens/introduction/continue_button.dart';

class Introduction3 extends StatelessWidget {
  final String role;
  const Introduction3({super.key, required this.role});

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
                    ? 'Việc lớn việc bé\nAlo Vua Thợ nhé!'
                    : 'Hỗ trợ nghiệp vụ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: role == 'customer' ? Colors.black : Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              ?role != 'customer'
                  ? Text(
                      'Nâng cao tay nghề với các khóa\nđào tạo hàng đầu.',
                      style: TextStyle(color: Colors.blue[900], fontSize: 16),
                      textAlign: TextAlign.center,
                    )
                  : null,
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: ContinueButton(
                      role: role,
                      label: 'Bắt đầu',
                      targetPage: Home(role: role),
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
