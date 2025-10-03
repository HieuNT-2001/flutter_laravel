import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/login_register/login_register.dart';

class HomeBottomBar extends StatelessWidget {
  final bool isCustomer;
  const HomeBottomBar({super.key, required this.isCustomer});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegister(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: isCustomer ? Colors.amber : Colors.blue[900],
                side: BorderSide(
                  color: isCustomer ? Colors.amber : Colors.blue[900]!,
                ),
              ),
              child: const Text(
                "Đăng ký",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegister(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: isCustomer ? Colors.black : Colors.white,
                backgroundColor: isCustomer ? Colors.amber : Colors.blue[900],
              ),
              child: const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
