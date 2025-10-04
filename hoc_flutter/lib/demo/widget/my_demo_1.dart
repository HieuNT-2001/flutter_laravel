import 'package:flutter/material.dart';

class MyDemo1 extends StatelessWidget {
  const MyDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/new_york_city.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'TinCoder',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kenh chia se lap trinh Flutter hoan toan mien phi. Kenh chia se lap trinh Flutter hoan toan mien phi. Kenh chia se lap trinh Flutter hoan toan mien phi.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
