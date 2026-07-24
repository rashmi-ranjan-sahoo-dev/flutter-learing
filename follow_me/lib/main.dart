import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Color bodyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          title: const Text(
            "My Profile",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 5,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 20),
              const Text(
                "Rashmi Ranjan Sahoo",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Exploring Flutter"),
              const SizedBox(height: 30),

              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bodyColor = Colors.blue.shade100;
                      });
                    },
                    child: const Text("Blue"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bodyColor = Colors.green.shade100;
                      });
                    },
                    child: const Text("Green"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bodyColor = Colors.orange.shade100;
                      });
                    },
                    child: const Text("Orange"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bodyColor = Colors.purple.shade100;
                      });
                    },
                    child: const Text("Purple"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}