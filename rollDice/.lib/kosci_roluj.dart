import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void roluj() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 250,
        ),
        TextButton(
          onPressed: roluj,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 25,
            ),
            foregroundColor: const Color.fromARGB(255, 221, 183, 15),
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('roluj kosci'),
        )
      ],
    );
  }
}
