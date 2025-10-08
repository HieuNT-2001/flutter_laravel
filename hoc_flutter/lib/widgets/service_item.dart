import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/popup_login_register.dart';

class ServiceItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final double? size;

  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(),
        context: context,
        builder: (context) {
          return const PopupLoginRegister(isCustomer: true);
        },
      ),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Image.asset(icon, width: size, height: size),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
