import 'dart:math';

import 'package:flutter/material.dart';

class Dice {
  final int value;
  final String image;

  const Dice({
    required this.value,
    required this.image,
  });
}

final List<Dice> diceList = [
  Dice(value: 1, image: "assets/images/dice1.jpg"),
  Dice(value: 2, image: "assets/images/dice2.png"),
  Dice(value: 3, image: "assets/images/dice3.png"),
  Dice(value: 4, image: "assets/images/dice4.jpg"),
  Dice(value: 5, image: "assets/images/dice5.jpg"),
  Dice(value: 6, image: "assets/images/dice6.png"),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random random = Random();

  Dice currentDice = diceList[0];

  void rollDice() {
    setState(() {
      currentDice = diceList[random.nextInt(6)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              title: const Center(
                child: Text("Dice Roller"),
              ),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                currentDice.image,
                width: 180,
                height: 180,
              ),

              const SizedBox(height: 20),

              Text(
                "Dice Value: ${currentDice.value}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: rollDice,
                child: const Text(
                  "Roll Dice",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}