import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/login_register/login_register.dart';

class HomeAppBar extends StatelessWidget {
  final bool isCustomer;
  final ValueChanged<bool> onChanged;

  const HomeAppBar({
    super.key,
    required this.isCustomer,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Trang chủ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              isCustomer ? "Khách" : "Thợ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Transform.scale(
              scale: 1.2,
              child: Switch(
                activeThumbImage: const AssetImage("assets/images/khach.png"),
                inactiveThumbImage: const AssetImage("assets/images/tho.png"),
                activeThumbColor: Colors.amber[700],
                inactiveThumbColor: Colors.blue[900],
                value: isCustomer,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginRegister()),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bạn chưa có tài khoản vua thợ?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isCustomer
                        ? "Đăng ký ngay để tìm thợ"
                        : "Hoàn tất đăng ký để nhận công\nviệc ngay hôm nay!",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset("assets/images/khach.png", height: 80),
            ],
          ),
        ),
      ],
    );
  }
}
