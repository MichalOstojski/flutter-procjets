import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_answers.dart';
import 'package:quiz_app/questions_sumarry.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });
  final void Function() onRestart;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSumaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'odpowiedziales na $numCorrectQuestions z $numTotalQuestions pytan mordziaty',
              style: GoogleFonts.tiltPrism(
                  color: const Color.fromARGB(255, 55, 39, 14),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 25,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.airline_stops_outlined),
              label: const Text('Naciskaj'),
            ),
          ],
        ),
      ),
    );
  }
}
