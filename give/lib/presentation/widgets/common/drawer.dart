import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final foregroundColor = Theme.of(context).colorScheme.onPrimary;
    final errorColor = Theme.of(context).colorScheme.error;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height:
                      105, // Adjust this height value as needed (e.g. 100, 120, 140)
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(color: primaryColor),
                  child: SafeArea(
                    bottom:
                        false, // Prevents adding unnecessary extra padding at the bottom
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            color: foregroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: errorColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () => Navigator.pop(context), // Closes the sidebar
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('My Campaigns'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to My Campaigns
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Settings
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to About
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('More From Give'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to More From Give
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: errorColor,
              foregroundColor: foregroundColor,
            ),
             child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
