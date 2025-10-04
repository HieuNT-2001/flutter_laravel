import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/popup_login_register.dart';

class Event extends StatelessWidget {
  final bool isCustomer;
  const Event({super.key, required this.isCustomer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(),
          context: context,
          builder: (context) {
            return PopupLoginRegister(isCustomer: isCustomer);
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sự kiện đang diễn ra',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/event.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
