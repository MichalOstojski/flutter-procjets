import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 280,
            color: const Color.fromARGB(147, 0, 0, 0),
          ),
          const SizedBox(
            height: 30,
          ),
          Text('Ostojowy quiz ogólny',
              style: GoogleFonts.tiltPrism(
                  color: const Color.fromARGB(255, 55, 39, 14),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 56, 30, 4),
            ),
            icon: const Icon(Icons.accessibility_new_outlined),
            label: const Text('Naciskaj'),
          )
        ],
      ),
    );
  }
}
