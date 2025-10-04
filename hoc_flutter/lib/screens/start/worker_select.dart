import 'package:flutter/material.dart';

class WorkerSelect extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onSelect;

  const WorkerSelect({
    super.key,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset('assets/images/tho.png', fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(
                'THỢ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
