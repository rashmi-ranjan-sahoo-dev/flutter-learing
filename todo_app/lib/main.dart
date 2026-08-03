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
  bool isLightMode = true;

  void toggleTheme() {
    setState(() {
      isLightMode = !isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",

      theme: isLightMode ? ThemeData.light() : ThemeData.dark(),

      home: HomeScreen(toggle: isLightMode, toggleEvent: toggleTheme),
    );
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
  final TextEditingController controller = TextEditingController();

  final List<Map<String, dynamic>> todos = [];

  void addTodo() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      todos.add({"title": controller.text.trim(), "completed": false});
    });

    controller.clear();

    // Hide keyboard
    FocusScope.of(context).unfocus();
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleCompleted(int index, bool? value) {
    setState(() {
      todos[index]["completed"] = value ?? false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: widget.toggleEvent,
            icon: Icon(widget.toggle ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),

      body: todos.isEmpty
          ? const Center(
              child: Text("No Todos Yet", style: TextStyle(fontSize: 20)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo["completed"],
                      onChanged: (value) => toggleCompleted(index, value),
                    ),
                    title: Text(
                      todo["title"],
                      style: TextStyle(
                        fontSize: 18,
                        decoration: todo["completed"]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTodo(index),
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter a new todo...",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  onSubmitted: (_) => addTodo(),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: addTodo,
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
