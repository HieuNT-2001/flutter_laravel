import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/introduction/introduction1.dart';

class ContinueButton extends StatelessWidget {
  final String role;
  const ContinueButton({super.key, required this.role});

  void _nextPage(BuildContext context) {
    if (role.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Introduction1(role: role)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _nextPage(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: role == 'worker' ? Colors.blue[900] : Colors.amber,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        role.isEmpty ? 'Vui lòng chọn một vai trò để tiếp tục' : 'Tiếp tục',
        style: TextStyle(
          color: role == 'worker' ? Colors.white : Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
