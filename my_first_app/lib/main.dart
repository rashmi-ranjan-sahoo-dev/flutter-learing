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
  String btnName = "Click me";
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("My Firts flutter app")),
        body: curIndex == 0 ? Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  setState(() {
                    btnName = btnName == "Click me" ? "Clicked" : "Click me";
                  });

                  debugPrint("Button Clicked");
                },
                child: Text(btnName),
              ),

              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    btnName = btnName == "Click me" ? "Clicked" : "Click me";
                  });

                  debugPrint("Button Clicked");
                },
                child: Text(btnName),
              ),
            ],
          ),
        ) : Image.asset('images/imageflutter.jpg'),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: "Setting",
              icon: Icon(Icons.settings),
            ),
          ],
          currentIndex: curIndex,
          onTap: (int index) {
            setState(() {
              curIndex = index;
            });
          },
        ),
      ),
    );
  }
}
