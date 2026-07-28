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
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("hii"), centerTitle: true),
        body: Container(
          color: _color,
          child: Center(
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _color = Colors.black;
                    });
                  },
                  child: Text("black"),
                ),ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _color = Colors.pink;
                    });
                  },
                  child: Text("pink"),
                ),ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _color = Colors.green;
                    });
                  },
                  child: Text("pink"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
