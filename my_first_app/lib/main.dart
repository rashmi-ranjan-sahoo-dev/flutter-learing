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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyAppExtention(),
    );
  }
}

class MyAppExtention extends StatefulWidget {
  const MyAppExtention({super.key});

  @override
  State<MyAppExtention> createState() => _MyAppExtentionState();
}

class _MyAppExtentionState extends State<MyAppExtention> {
  String btnName = "Click me";
  int curIndex = 0;
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Firts flutter app")),
      body: curIndex == 0
          ? Container(
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
                      debugPrint("Button Clicked");
                    },
                    child: Text(btnName),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NextPage()),
                      );
                    },
                    child: Text("Next Page"),
                  ),
                ],
              ),
            )
          : GestureDetector(
            onTap : ((){
              setState(() {
                isChange = !isChange;
              });
            }),
            child:isChange ? Image.asset('images/imageflutter.jpg'): Image.network("https://images.unsplash.com/photo-1493612276216-ee3925520721?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tfGVufDB8fDB8fHww")),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
        ],
        currentIndex: curIndex,
        onTap: (int index) {
          setState(() {
            curIndex = index;
          });
        },
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
