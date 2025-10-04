import 'dart:math';

import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  RollDiceState createState() => RollDiceState();
}

class RollDiceState extends State<RollDice> {
  int currentDice = 0;
  final List<String> diceImages = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];

  void rollDice() => setState(() {
    currentDice = Random().nextInt(diceImages.length);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [
              Color.fromARGB(255, 33, 5, 109),
              Color.fromARGB(255, 68, 21, 149),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(diceImages[currentDice], width: 200),
            ElevatedButton(onPressed: rollDice, child: const Text('Roll Dice')),
          ],
        ),
      ),
    );
  }
}
