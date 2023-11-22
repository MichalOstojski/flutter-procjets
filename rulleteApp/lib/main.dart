import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const RuletkaApp());

class RuletkaApp extends StatelessWidget {
  const RuletkaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruletka App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RuletkaScreen(),
    );
  }
}

class RuletkaScreen extends StatefulWidget {
  const RuletkaScreen({Key? key}) : super(key: key);

  @override
  _RuletkaScreenState createState() => _RuletkaScreenState();
}

class _RuletkaScreenState extends State<RuletkaScreen> {
  int? selectedNumber;
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 66, 10),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Ruletka',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 149, 35),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://b2b.g3poland.com/eng_pl_Ruletka-profesjonalna-sr-36-cm-HG-2200_5.jpg',
              width: 400,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              selectedNumber != null
                  ? 'Wybrana liczba: $selectedNumber'
                  : 'Nie wybrano liczby',
              style: TextStyle(
                fontSize: 20,
                color: selectedColor == 'Czerwony'
                    ? Colors.red
                    : selectedColor == 'Czarny'
                        ? Colors.black
                        : Colors.green, // Dostosuj kolory tekstu
              ),
            ),
            const SizedBox(height: 10),
            Text(
              selectedColor != null
                  ? 'Kolor: $selectedColor'
                  : 'Nie wybrano koloru',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int randomNum =
                    Random().nextInt(37); // 0-36 dla ruletki europejskiej
                String color = getColor(randomNum);
                setState(() {
                  selectedNumber = randomNum;
                  selectedColor = color;
                });
              },
              child: const Text('Losuj liczbę'),
            ),
          ],
        ),
      ),
    );
  }

  String getColor(int number) {
    if (number == 0) {
      return 'Zielony';
    } else if ([
      15,
      4,
      2,
      17,
      6,
      13,
      11,
      8,
      10,
      24,
      33,
      20,
      31,
      22,
      29,
      28,
      35,
      26
    ].contains(number)) {
      // Czarne obszary
      return 'Czarny';
    } else {
      // Czerwone obszary
      return 'Czerwony';
    }
  }
}
