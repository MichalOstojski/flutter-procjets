import 'package:flutter/material.dart';

import 'package:first_app/gradient_conteiner.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientConteiner(
          Color.fromARGB(255, 23, 3, 177),
          Color.fromARGB(255, 76, 139, 248),
        ),
      ),
    ),
  );
}
