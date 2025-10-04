import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Username:',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text('Nguyen van An', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Email:',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text('abc@gmail.com', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Address:',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Hong Bang, Hai Phong',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
