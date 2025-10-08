// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double size;
  final Widget target;

  const QuickAccessItem({
    super.key,
    required this.icon,
    required this.title,
    required this.target,
    this.size = 50,
  });

  void _lauchTarget(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => target));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _lauchTarget(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.yellow,
            child: Icon(icon, size: size, color: Colors.black),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
