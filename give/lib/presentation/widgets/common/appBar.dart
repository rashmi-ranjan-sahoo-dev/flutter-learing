import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Determine the contrasting text/icon color based on primary background
    final primaryColor = Theme.of(context).colorScheme.primary;
    final foregroundColor = Theme.of(context).colorScheme.onPrimary;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30, 
          fontWeight: FontWeight.bold,
          color: foregroundColor, // Ensures readable text over primary background
        ),
      ),
      centerTitle: false,
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: foregroundColor), // Keeps menu icon readable

      // Right section: Menu Icon Button
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Open menu',
          onPressed: () {
            // Opens the endDrawer attached to the current Scaffold
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  // Moved inside the class body
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}