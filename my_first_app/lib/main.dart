import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 120,
          child: AnimatedDefaultTextStyle(
            child: const Text('flutter'),
            style: TextStyle(
              fontSize: _fontSize,
              color: _color,
              fontWeight: FontWeight.bold,
            ),
            duration: const Duration(milliseconds: 300),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _fontSize = _first ? 90 : 60;
              _color = _first ? Colors.white : Colors.blue;
              _first = !_first;
            });
          },
          child: const Text(
            "Switch",
          ),
        ),
      ],
    );
  }
}
