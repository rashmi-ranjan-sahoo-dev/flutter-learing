import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GiveApp());
}

class GiveApp extends StatelessWidget {
  const GiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GiveApp',
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: HomeScreen()
      ),
    );
  }
}

// class SetupCheckScreen extends StatelessWidget {
//   const SetupCheckScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final campaign = mockCampaigns.first;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CareBridge'),
//       ),
//       body: Center(
//         child: Text(
//           'Setup complete!\\n\\nMock campaign: ${campaign.title}',
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }