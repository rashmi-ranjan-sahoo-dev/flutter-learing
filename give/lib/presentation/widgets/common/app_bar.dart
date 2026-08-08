import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final foregroundColor = Theme.of(context).colorScheme.onPrimary;
    final isCompact = MediaQuery.of(context).size.width < 600;
    final titleFontSize = isCompact ? 20.0 : 24.0;

    return AppBar(
      title: Text(title, style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: foregroundColor)),
      centerTitle: false,
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: foregroundColor),
      actions: [
        Builder(
          builder: (actionContext) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (!isCompact)
              //   TextButton.icon(
              //     onPressed: () => Scaffold.of(actionContext).openEndDrawer(),
              //     icon: const Icon(Icons.inventory_2_outlined),
              //     label: const Text('My Items'),
              //     style: TextButton.styleFrom(foregroundColor: foregroundColor),
              //   ),
              IconButton(
                icon: const Icon(Icons.menu),
                tooltip: isCompact ? 'Open menu and My Items' : 'Open menu',
                onPressed: () => Scaffold.of(actionContext).openEndDrawer(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
