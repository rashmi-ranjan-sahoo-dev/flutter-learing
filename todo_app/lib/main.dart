import 'package:flutter/material.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool toggle = true;

  void toggleEvent() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo",
      theme: toggle ? ThemeData.light() : ThemeData.dark(),
      //  home: Test(),
      home: HomeScreen(toggle: toggle, toggleEvent: toggleEvent),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("flutter works")));
  }
}

class HomeScreen extends StatefulWidget {
  final bool toggle;
  final VoidCallback toggleEvent;

  const HomeScreen({
    super.key,
    required this.toggle,
    required this.toggleEvent,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 202, 105, 219),
          // backgroundColor: Theme.of(context).colorScheme.primary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Todo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      widget.toggleEvent();
                    },
                    icon: Icon(
                      widget.toggle ? Icons.dark_mode : Icons.light_mode,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.check_box)),
                  //  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_box_outline_blank_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Text("body"),
      bottomNavigationBar: ColoredBox(color: Color.fromARGB(255, 202, 105, 219),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter a new todo..',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width:12),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ) , )
    );
  }
}
