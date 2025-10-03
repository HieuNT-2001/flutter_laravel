import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/login_register/login_register.dart';

class PopupLoginRegister extends StatelessWidget {
  final bool isCustomer;

  const PopupLoginRegister({super.key, required this.isCustomer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 160,
        child: Column(
          children: [
            const Text(
              "Sử dụng vua thợ ngay!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Chỉ cần 10 giây, bạn có thể truy cập vào các dịch vụ của chúng tôi và đặt thợ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      foregroundColor: isCustomer
                          ? Colors.amber
                          : Colors.blue[900],
                      side: BorderSide(
                        color: isCustomer ? Colors.amber : Colors.blue[900]!,
                      ),
                    ),
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                      backgroundColor: isCustomer
                          ? Colors.amber
                          : Colors.blue[900],
                    ),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
