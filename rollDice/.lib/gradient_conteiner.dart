import 'package:first_app/kosci_roluj.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientConteiner extends StatelessWidget {
  const GradientConteiner(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;

  @override
  build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
